import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
      home: LoginPage(),
    )
  );
}

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top:60, 
          left:40, 
          right:40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width:128,
              height:128,
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(
              height:50,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Usuário",
                labelStyle: TextStyle(
                  color: Color(CE2121),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height:15,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Color(CE2121),
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                ),
              ),
              style: TextStyle(fontSize: 20),
            ),
            Container(
              height:60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color(CE2121),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
                color: Color(02141F),
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Entrar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(CE2121),
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (),
                      ),
                    ),
                  },
                ),
              ),
            ),
            SizedBox(
              height:10,
            ),
            Container(
              height:40,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  "Esqueceu a senha?",
                  textAlign: TextAlign.center,
                  color: Color(F0B033),
                ),
                onPressed: (){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => ResetPassawordPage(),
                    ),
                  );
                }
              ),
            ),
            SizedBox(
              height: 90,
            ),
            Container(
              height:40,
              child: FlatButton(
                child: Text(
                  "Faça o seu cadastro aqui",
                  textAlign: TextAlign.center,
                  color: Color(F0B033),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (),//SignupPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}