const app = require('express')()
const bcrypt = require("bcrypt");
const salt = bcrypt.genSaltSync(10);
process.env['NODE_TLS_REJECT_UNAUTHORIZED'] = 0;

const passwordGenerator = () => {
    let password = ''
    let index = 0;

    let lowerCaseLetters = 'abcdefghijklmonpqrstuvwxyz';
    let upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    let numbers = '123456789';
    let specials = '"!@#$%¨&*()_+=-';

    index = Math.floor(Math.random() * ((lowerCaseLetters.length-1) + 1) )
    password += lowerCaseLetters[index]

    index = Math.floor(Math.random() * ((upperCaseLetters.length-1) + 1) )
    password += upperCaseLetters[index]

    index = Math.floor(Math.random() * ((numbers.length-1) + 1) )
    password += numbers[index]

    index = Math.floor(Math.random() * ((specials.length-1) + 1) )
    password += specials[index]

    index = Math.floor(Math.random() * ((lowerCaseLetters.length-1) + 1) )
    password += lowerCaseLetters[index]

    index = Math.floor(Math.random() * ((upperCaseLetters.length-1) + 1) )
    password += upperCaseLetters[index]

    index = Math.floor(Math.random() * ((numbers.length-1) + 1) )
    password += numbers[index]

    index = Math.floor(Math.random() * ((specials.length-1) + 1) )
    password += specials[index]

    return password
}

app.listen(3000, () => {
    console.log('O back-end está rodando na porta 3000...')
})

app.post('/login', (req, resp) => {

    let userLogin = false

    let wrongPassword = false

    let registeredUsers = require('./registered_users.json')

    registeredUsers.users.forEach(user => {
        if(req.query.username == user.username){
            const correctPassword = bcrypt.compareSync(req.query.password, user.password);

            if(correctPassword){
                userLogin = {
                    'username': user.username,
                    'password': user.password,
                }
                return
            }else{
                wrongPassword = true
                return
            }
        }
    })


    if(userLogin){
        resp.status(200).setHeader("Message", "Usuário logado com sucesso.").send();
        return
    }else if(wrongPassword){
        resp.status(204).setHeader("Message", "A senha está incorreta.").send();
        return
    }else{
        resp.status(204).setHeader("Message", "Usuário não cadastrado no sistema.").send();
        return
    }
})

app.post('/signup', (req, resp) => {

    let newUser = false

    let usernameAlreadyExists = false

    let emailAlreadyExists = false

    const fs = require('fs');

    let registeredUsers = require('./registered_users.json')

    registeredUsers.users.forEach(user => {
        if(req.query.username == user.username){
            usernameAlreadyExists = true
            return
        }

        if(req.query.email == user.email){
            emailAlreadyExists = true
            return
        }
    })

    if(usernameAlreadyExists){
        resp.status(204).setHeader("Message", "O nome de usuário já está cadastrado no sistema.").send();
        return
    }

    if(emailAlreadyExists){
        resp.status(204).setHeader("Message", "O email já está cadastrado no sistema.").send();
        return
    }

    const password = bcrypt.hashSync(req.query.password, salt);

    newUser = {
        'username': req.query.username,
        'password': password,
        'email': req.query.email
    }

    registeredUsers.users.push(newUser)
    
    registeredUsers = JSON.stringify(registeredUsers)

    fs.writeFile('registered_users.json', registeredUsers, (err) => {
        if (err) {
            newUser = false
        }

        resp.status(200).setHeader("Message", "Novo usuário cadastrado com sucesso.").send();
        return
    });

    if(!newUser){
        resp.status(204).setHeader("Message", "Erro ao cadastrar novo usuário.").send();
        return
    }
})

app.post('/forgot', (req, resp) => {

    const fs = require('fs');

    let validEmail = false;

    let registeredUsers = require('./registered_users.json')

    registeredUsers.users.forEach(user => {
        console.log(user.email)
        if(req.query.email == user.email){
            validEmail = true;
            return
        }
    })

    if(!validEmail){
        resp.status(204).setHeader("Message", "O email não está cadastrado no sistema.").send();
        return
    }else{
        const newPassword = passwordGenerator();


        const email = import('emailjs');
        email.then(emailResp => {
            const pinguEmail = new emailResp.SMTPClient({
                user: 'servicepingu@gmail.com',
                password: 'tvddjwbryqluqnxh',
                host: 'smtp.gmail.com',
                domain: 'gmail.com',
                ssl: true,
                port: 465
            });
        
            pinguEmail.send(
                {
                    text: `Sua nova senha é ${newPassword}`,
                    from: 'servicepingu@gmail.com',
                    to: req.query.email,
                    cc: '',
                    subject: 'Redefinindo sua senha no Pingu!',
                },
                (err, message) => {
                    if(err){
                        resp.status(204).setHeader("Message", "Erro ao enviar a mensagem.").send();
                        return
                    }else{
                        let hashPassword = bcrypt.hashSync(newPassword, salt);
                        registeredUsers.users.forEach((user, index) => {
                            let newUser = {
                                'username': user.username,
                                'password': hashPassword,
                                'email': user.email
                            }

                            delete registeredUsers.users[index]

                            registeredUsers.users.push(newUser)
    
                            registeredUsers = JSON.stringify(registeredUsers)

                            fs.writeFile('registered_users.json', registeredUsers, (err) => {
                                if (err) {
                                    newUser = false
                                }
                        
                                resp.status(200).setHeader("Message", "Novo usuário cadastrado com sucesso.").send();
                                return
                            });
                        
                            if(!newUser){
                                resp.status(204).setHeader("Message", "Erro ao cadastrar novo usuário.").send();
                                return
                            }

                            // if(req.query.email == user.email){
                            //     fs.readFile('registered_users.json', 'utf8', function (err,data) {
                            //         if (err) {
                            //           return console.log(err);
                            //         }
                            //         var result = data.replace(/string to be replaced/g, 'replacement');
                                  
                            //         fs.writeFile(someFile, result, 'utf8', function (err) {
                            //            if (err) return console.log(err);
                            //         });
                            //       });
                            //     validEmail = true;
                            //     return
                            // }
                        })

                        resp.status(200).setHeader("Message", "A nova senha foi enviada para o seu email.").send();
                        return
                    }
                }
            )
        })
    }
})
