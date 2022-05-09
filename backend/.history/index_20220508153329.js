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

    console.log(req.query)

    const newUser = {
        'username': req.query['username'],
        'password': req.query['password']
    }

    const newUserJson = JSON.stringify(newUser)

    fs.appendFile('registered_users.json', newUserJson, (err) => {
        if (err) {
            throw err;
        }
        console.log("Novo usuario adicionado.");
    });

    // fs.appendFileSync("registered_users.json",newUserJson,"utf-8");

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
