// import 'dart:indexed_db';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
// import 'package:pdm/src/Features/auth/presentation/viewmodel/signup_screen_viewmodel.dart';

import './forgot_screen.dart';
import './signup_screen.dart';
import 'package:pdm/src/google_maps.dart';
// import './../../viewmodel/login_screen_viewmodel.dart';

class LoginScreen extends StatelessWidget{
  // const LoginScreen({Key? key}) : super(key: key);

  @override
  // State<LoginScreen> createState() => _LoginScreenState();

  late ColorScheme _colors;
  late ThemeData _theme;

  // Widget get _loginIndicator => Visibility(
  //   child: const LinearProgressIndicator(
  //     backgroundColor: Colors.white,
  //   ),
  //   visible: store.isLoading,
  // );

  // Widget get _username => widget.createFormField(
  //   title: 'username'.i18n(),
  //   theme: _theme,
  //   keyboardType: TextInputType.emailAddress,
  //   textInputAction: TextInputAction.next,
  //   hint: 'username_hint'.i18n(),
  //   enabled: !store.isLoading,
  //   errorText: store.error.username,
  //   onChange: (value) => store.username = value,
  // );

  // Widget get _password => widget.createFormField(
  //   title: 'password'.i18n(),
  //   theme: _theme,
  //   keyboardType: TextInputType.text,
  //   obscureText: true,
  //   hint: 'password_hint'.i18n(),
  //   enabled: !store.isLoading,
  //   errorText: store.error.password,
  //   onChange: (value) => store.password = value,
  // );

  // Widget get _loginButton => Container(
  //   width: double.infinity,
  //   height: 40,
  //   child: ElevatedButton(
  //     style: ElevatedButton.styleFrom(
  //       side: BorderSide(
  //         width: 2.0,
  //         color: Color.fromARGB(255, 0, 0, 0),
  //       ),
  //       primary: Color.fromARGB(255, 255, 255, 255),
  //     ),
  //     onPressed: store.isLoading ? null : store.login,
  //     child: Text('login'.i18n()),
  //   ),
  // );

  // Widget get _forgotPasswordButton = ContainerText(
  //   width: 200,
  //   height: 30,
  //   child: TextButton(
  //     style: TextStyle(
  //       color: Color.fromARGB(255, 255, 220, 23)),
  //     ),
  //     onPressed: store.isLoading ? null : () {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(builder: (context) => ForgotScreen())
  //       );
  //     },
  //     child: Text('forgot_password'.i18n()),
  //   ),
  // );

  // Widget get _singUp => ContainerText(
  //   width: 200,
  //   height: 30,
  //   child: TextButton(
  //     style: TextStyle(
  //       color: Color.fromARGB(255, 255, 220, 23),
  //     ),
  //     onPressed: () => {
  //       Navigator.of(context).push(
  //         MaterialPageRoute(builder: (context) => SignupScreen())
  //       ), 
  //     },
  //   ),
  //   child: Text('signup'.i18n()),
  // );

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
                              onPressed: () => {},
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
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 220, 23)),
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

}

