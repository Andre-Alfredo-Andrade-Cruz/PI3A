// import 'dart:indexed_db';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdm/src/Features/auth/domain/usecase/forgot_screen_usecase.dart';

import 'login_page.dart';
import 'signup_page.dart';
// import './../../viewmodel/forgot_screen_viewmodel.dart';

class ForgotScreen extends StatelessWidget {
  // const ForgotScreen({Key? key}) : super(key: key);

  // @override
  // State<ForgotScreen> createState() => _ForgotScreenState();

  var emailTextFieldController = TextEditingController();
  var forgotUseCase = ForgotUseCase();

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
                      "E-mail:",
                      style: TextStyle(color: Color.fromARGB(255, 1, 1, 1)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                          controller: emailTextFieldController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
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
                              child: Text("Confirmar",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              onPressed: () => {
                                    print('test'),
                                    print(emailTextFieldController.text),
                                    forgotUseCase
                                        .forgot(emailTextFieldController.text)
                                  },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 30, 255, 14),
                              )),
                          // width: double.infinity,
                          height: 40),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ]),
              width: double.infinity,
              height: double.infinity,
            )));
  }
}
