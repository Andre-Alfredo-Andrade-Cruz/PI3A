const app = require('express')()

app.listen(3000, () => {
    console.log('O back-end está rodando na porta 3000...')
})

app.post('/login', (req, resp) => {

    let user = false

    let wrongPassword = false

    let registeredUsers = require('./registered_users.json')

    registeredUsers.users.forEach(user => {
        if(req.query.username == user.username){
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
        resp.status(204).setHeader("Message", "Usuário não encontrado no sistema.").send();
        return
    }
})

app.post('/signup', (req, resp) => {

    let newUser = {}

    let usernameAlreadyExists = false

    const fs = require('fs');

    let registeredUsers = require('./registered_users.json')

    registeredUsers.users.forEach(user => {
        if(req.query.username == user.username){
            usernameAlreadyExists = true
            return
        }
    })

    if(usernameAlreadyExists){
        resp.status(204).setHeader("Message", "O nome de usuário já existe.").send();
        return
    }

    newUser = {
        'username': req.query.username,
        'password': req.query.password,
        'email': req.query.email
    }

    registeredUsers.users.push(newUser)
    
    registeredUsers = JSON.stringify(registeredUsers)

    fs.writeFile('registered_users.json', registeredUsers, (err) => {
        if (err) {
            newUser = false
        }

        resp.status(200).setHeader("Message", "Novo usuário adicionado com sucesso.").send();
        return
    });

    if(!newUser){
        resp.status(204).setHeader("Message", "Erro ao adicionar novo usuário.").send();
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
