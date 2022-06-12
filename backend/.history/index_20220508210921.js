const app = require('express')()

let registeredUsers = require('./registered_users.json')

app.listen(3000, () => {
    console.log('O back-end está rodando na porta 3000...')
})

// app.get('/login', (req, resp) => {

//     registeredUsers.forEach(user => {
//         if(req.email == user.email && req.password == user.password){
//             if(req.password == user.password){
//                 resp.send({
//                     login: true,
//                     message: "Usuario logado com sucesso."
//                 })
//                 return
//             }else{
//                 resp.send({
//                     login: false,
//                     message: "A senha está incorreta."
//                 })
//                 return
//             }
//         }
//     })

//     resp.send({
//         login: false,
//         message: "Usuario não encontrado no sistema."
//     })

//     return
// })

app.post('/login', (req, resp) => {

    let hasUser = false

    registeredUsers.users.forEach(user => {
        if(req.query.username == user.username){
            if(req.query.password == user.password){
                hasUser = true
                resp.status(200).setHeader("Message", "Usuário logado com sucesso.").send();
                return
            }else{
                hasUser = true
                resp.status(204).setHeader("Message", "A senha está incorreta.").send();
                return
            }
        }
    })

    if(!hasUser){

        resp.status(204).setHeader("Message", "Usuário não encontrado no sistema.").send();

        return
    }

    return
})

app.post('/signup', (req, resp) => {

    const fs = require('fs');

    console.log(req.query)

    try{
        const newUser = {
            'username': req.query.username,
            'password': req.query.password,
            'email': req.query.email
        }
    
        registeredUsers.users.push(newUser)
    
        registeredUsers = JSON.stringify(registeredUsers)
    
        fs.writeFile('registered_users.json', registeredUsers, (err) => {
            if (err) {
                console.log('kkkkk')
                throw err;
            }
            // console.log("Novo usuario adicionado.");

            return
        });

        console.log("Novo usuario adicionado.");

        resp.status(200).setHeader("Message", "Novo usuário adicionado com sucesso.").send();
        return

    }catch(error){
        console.log(error)
        console.log('erro ao adicionar usuario')
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
