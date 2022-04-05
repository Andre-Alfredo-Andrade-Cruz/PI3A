import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
              child:  Column(children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 40)),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
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
                    Text("Usuario:"),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite seu email',
                      )),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text("Senha:"),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Digite sua senha',
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
                            child: Text("Entrar"),
                            onPressed: () => {},
                          ),
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
                          child: Text("Esqueceu a senha?"),
                          onPressed: () => {},
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
                          child: Text("Faça o seu cadastro aqui."),
                          onPressed: () => {},
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
