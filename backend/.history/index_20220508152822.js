const app = require('express')()
const fs = require('fs');

let users = require('./registered_users.json')

app.listen(3000, () => {
    console.log('O back-end está rodando na porta 3000...')
})

// app.get('/login', (req, resp) => {

//     users.forEach(user => {
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

// app.post('/login', (req, resp) => {

//     let hasUser = false

//     users.forEach(user => {
//         if(req.query.username == user.username && req.query.password == user.password){
//             if(req.query.password == user.password){
//                 hasUser = true
//                 resp.status(200).setHeader('Authorization', '123456').send({
//                     login: true,
//                     message: "Usuario logado com sucesso."
//                 })
//             }else{
//                 resp.status(400).send({
//                     login: false,
//                     message: "A senha está incorreta."
//                 })
//             }
//         }
//     })

//     if(!hasUser){
//         resp.status(404).send({
//             login: false,
//             message: "Usuario não encontrado no sistema."
//         })
//     }


//     return
// })

app.post('/signup', (req, resp) => {

    const newUser = {
        'username': data['username'],
        'password': data['password']
    }

    fs.writeFile('registered_users.json', newUser, (err) => {
        if (err) {
            throw err;
        }
        console.log("Novo usuario adicionado.");
    });

    resp.status(404).send({
        login: false,
        message: "Usuario não encontrado no sistema."
    })
    return
})

// app.post('/login', (req, resp) => {

//     let hasUser = false

//     users.forEach(user => {
//         if(req.query.username == user.username && req.query.password == user.password){
//             if(req.query.password == user.password){
//                 hasUser = true
//                 resp.status(200).setHeader('Authorization', '123456').send({
//                     login: true,
//                     message: "Usuario logado com sucesso."
//                 })
//             }else{
//                 resp.status(400).send({
//                     login: false,
//                     message: "A senha está incorreta."
//                 })
//             }
//         }
//     })

//     if(!hasUser){
//         resp.status(404).send({
//             login: false,
//             message: "Usuario não encontrado no sistema."
//         })
//     }


//     return
// })
