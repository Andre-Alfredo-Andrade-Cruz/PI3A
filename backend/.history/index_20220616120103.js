const app = require('express')()
const bcrypt = require("bcrypt");
const salt = bcrypt.genSaltSync(10);
const email = import('emailjs').SMTPClient;

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

    let validEmail = false;

    users.forEach(user => {
        if(req.query.email == user.email){
            validEmail = true;
            return
        }
    })

    if(!validEmail){
        resp.status(204).setHeader("Message", "O email não está cadastrado no sistema.").send();
        return
    }else{

    }
})