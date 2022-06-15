// import 'dart:indexed_db';
//import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter_modular/flutter_modular.dart';
//import 'package:pdm/src/Features/auth/data/repository/login_screen_repository.dart';
import 'package:pdm/src/Features/auth/domain/usecase/login_screen_usecase.dart';
//import 'package:pdm/src/Features/auth/presentation/view/page/home_page.dart';
import 'package:pdm/src/Features/onboarding/presentation/view/page/splash_screen.dart';
// import 'package:pdm/src/Features/auth/presentation/viewmodel/signup_screen_viewmodel.dart';

//import '../../../domain/model/user.dart';
import 'forgot_page.dart';
import 'signup_page.dart';
// import './../../viewmodel/login_screen_viewmodel.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // const LoginScreen({Key? key}) : super(key: key);

  // Widget get _loginIndicator => Visibility(
  final loginTextFieldController = TextEditingController();

  final passwordTextFieldController = TextEditingController();

  final loginUseCase = LoginUseCase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('app_name'.i18n())),
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
                  'username'.i18n(),
                  style: TextStyle(color: Color.fromARGB(255, 255, 26, 1)),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                Flexible(
                  child: TextField(
                      controller: loginTextFieldController,
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
                  'password'.i18n(),
                  style: TextStyle(color: Color.fromARGB(255, 255, 26, 1)),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 10)),
            Row(
              children: [
                Flexible(
                  child: TextField(
                      controller: passwordTextFieldController,
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
                          child: Text('login'.i18n(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 3, 3))),
                          onPressed: () => {
                                loginUseCase
                                    .login(loginTextFieldController.text,
                                        passwordTextFieldController.text)
                                    .then((msg) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text('username_true'.i18n()),
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
                                        title: Text('username_false'.i18n()),
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
                        'forgot_password'.i18n(),
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 220, 23)),
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
                        'signup'.i18n(),
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 220, 23)),
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

// class _LoginScreenState extends ModularState<LoginScreen, LoginScreenViewModular>{

// }
