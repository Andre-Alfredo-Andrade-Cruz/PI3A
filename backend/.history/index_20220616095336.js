const app = require('express')()
const bcrypt = require("bcrypt");
const salt = bcrypt.genSaltSync(10);

app.listen(3000, () => {
    console.log('O back-end está rodando na porta 3000...')
})

app.post('/login', (req, resp) => {

    let user = false

    let wrongPassword = false

    let registeredUsers = require('./registered_users.json')

    registeredUsers.users.forEach(user => {
        if(req.query.username == user.username){
            bcrypt.hash(req.query.password, salt,)
            if(req.query.password == user.password){
                user = {
                    'username': req.query.username,
                    'password': req.query.password,
                }
                return
            }else{
                wrongPassword = true
                return
            }
        }
    })


    if(user){
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

    // newUser = {
    //     'username': req.query.username,
    //     'password': req.query.password,
    //     'email': req.query.email
    // }

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

    let hasUser = false

    users.forEach(user => {
        if(req.query.username == user.username){
            if(req.query.password == user.password){
                hasUser = true
                resp.status(200).setHeader('Authorization', '123456').send({
                    login: true,
                    message: "Usuario logado com sucesso."
                })
            }else{
                resp.status(400).send({
                    login: false,
                    message: "A senha está incorreta."
                })
            }
        }
    })

    if(!hasUser){
        resp.status(404).send({
            login: false,
            message: "Usuario não encontrado no sistema."
        })
    }


    return
})
