const app = require('express')()

let users = require('./registered_users.json')

app.listen(3000, () => {
    console.log('O back-end está rodando na porta 3000...')
})

app.get('/login', (req, resp) => {

    users.forEach(user => {
        if(req.email == user.email && req.password == user.password){
            if(req.password == user.password){
                resp.send({
                    login: true,
                    message: "Usuario logado com sucesso."
                })
                return
            }else{
                resp.send({
                    login: false,
                    message: "A senha está incorreta."
                })
                return
            }
        }
    })

    resp.send({
        login: false,
        message: "Usuario não encontrado no sistema."
    })

    return
})

app.post('/login', (req, resp) => {


    console.log(req)

    users.forEach(user => {
        if(req.email == user.email && req.password == user.password){
            if(req.password == user.password){
                resp.send({
                    login: true,
                    message: "Usuario logado com sucesso.",
                    statusCode: 200
                })
                return
            }else{
                resp.send({
                    login: false,
                    message: "A senha está incorreta."
                })
                return
            }
        }
    })

    resp.send({
        login: false,
        message: "Usuario não encontrado no sistema."
    })

    return
})
