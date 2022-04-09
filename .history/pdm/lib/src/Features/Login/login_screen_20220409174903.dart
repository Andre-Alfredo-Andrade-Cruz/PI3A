import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../ForgotPassword/forgot_screen.dart';
import '../Signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pingu Idiomas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: null,
            body: Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: ListView(children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 40)),
                Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.png',
                      width: 320,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "Usuario:",
                      style: TextStyle(color: Color.fromARGB(255, 255, 26, 1)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 246, 0, 4),
                                width: 2.0)),
                        // hintText: 'Digite seu email',
                      )),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "Senha:",
                      style: TextStyle(color: Color.fromARGB(255, 255, 26, 1)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'Digite sua senha',
                      )),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                          child: ElevatedButton(
                              child: Text("Entrar",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 3, 3))),
                              onPressed: () => {
                              },
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  width: 2.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                primary: Color.fromARGB(255, 255, 255, 255),
                              )),
                          width: double.infinity,
                          height: 40),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    SizedBox(
                        child: TextButton(
                          child: Text(
                            "Esqueceu a senha?",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 220, 23)),
                          ),
                          onPressed: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ForgotScreen())
                            )
                          },
                        ),
                        width: 200,
                        height: 30),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 50)),
                Row(
                  children: [
                    SizedBox(
                        child: TextButton(
                          child: Text(
                            "Faça o seu cadastro aqui.",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 220, 23)),
                          ),
                          onPressed: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignupScreen())
                            )
                          },
                        ),
                        width: 200,
                        height: 30),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ]),
              width: double.infinity,
              height: double.infinity,
            )));
  }
}
