// import 'dart:indexed_db';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pdm/src/Features/auth/data/repository/login_screen_repository.dart';
import 'package:pdm/src/Features/auth/domain/usecase/login_screen_usecase.dart';
import 'package:pdm/src/Features/auth/presentation/view/page/home_page.dart';
import 'package:pdm/src/Features/onboarding/presentation/view/page/splash_screen.dart';

import '../../../domain/model/user.dart';
import 'forgot_page.dart';
import 'signup_page.dart';

class LoginScreen extends StatelessWidget {

  late ColorScheme _colors;
  late ThemeData _theme;

  final loginTextFieldController = TextEditingController();
  final passwordTextFieldController = TextEditingController();
  final loginUseCase = LoginUseCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: ListView(children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 40)),
            Row(
              children: [
                Image.asset(
                  'lib/assets/images/logo.png',
                  width: 300,
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
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                Flexible(
                  child: TextField(
                      controller: loginTextFieldController,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 15.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                // color: Color.fromARGB(255, 0, 0, 0),
                                color: Color.fromRGBO(2, 20, 31, 1),
                                width: 2.0)),
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
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                Flexible(
                  child: TextField(
                      obscureText: true,
                      controller: passwordTextFieldController,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        contentPadding: EdgeInsets.only(left: 15.0),
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
                                  color: Color.fromARGB(255, 0, 0, 0))),
                          onPressed: () => {
                                loginUseCase
                                    .login(loginTextFieldController.text,
                                        passwordTextFieldController.text)
                                    .then((msg) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Usuário logado com sucesso!'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(""),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SplashScreen()));
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }).catchError((error) {
                                  print("error: $error");
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Erro ao fazer o login'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text("$error"),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                })
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
                        style:
                            TextStyle(color: Color.fromRGBO(255, 154, 131, 1)),
                      ),
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgotScreen()))
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
                        style:
                            TextStyle(color: Color.fromARGB(255, 154, 131, 1)),
                      ),
                      onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignupScreen()))
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
        ));
  }
}


