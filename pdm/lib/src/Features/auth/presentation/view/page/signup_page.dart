// import 'dart:indexed_db';
//import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:localization/localization.dart';
//import 'package:pdm/src/Features/auth/domain/repository/signup_screen_interface.dart';
import 'package:pdm/src/Features/auth/domain/usecase/signup_screen_usecase.dart';

//import '../../../data/repository/signup_screen_repository.dart';
//import '../../../domain/model/signup.dart';
import 'login_page.dart';
//import 'forgot_page.dart';
// import './../../viewmodel/signup_screen_viewmodel.dart';

// class SignupScreen extends StatelessWidget{
//   const SignupScreen({Key? key}) : super(key: key);

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

class SignupScreen extends StatefulWidget {

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
// class _SignupScreenState extends ModularState<SignupScreen,SignupScreenViewModular>{
  var usernameTextFieldController = TextEditingController();

  var nameTextFieldController = TextEditingController();

  var birthTextFieldController = TextEditingController();

  var emailTextFieldController = TextEditingController();

  var passwordTextFieldController = TextEditingController();

  var confirmPasswordTextFieldController = TextEditingController();

  // final signupRepository = SignupScreenRepository();
  var signupUseCase = SignupUseCase();

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
                      'User'.i18n(),
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: TextField(
                          controller: usernameTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          // style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'Digite seu nome',
                            // isCollapsed: true,
                          ),
                        )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'Name'.i18n(),
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: TextField(
                        controller: nameTextFieldController,
                        textAlignVertical: TextAlignVertical.center,
                        // style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          // hintText: 'Digite seu nome',
                          // isCollapsed: true,
                        ),
                      )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "E-mail:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                          controller: birthTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'Digite seu nome',
                            // isCollapsed: true,
                          )),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'birth'.i18n(),
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: SizedBox(
                      height: 40,
                      child: TextField(
                          controller: emailTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'Digite seu nome',
                            // isCollapsed: true,
                          )),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'password'.i18n(),
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                          controller: passwordTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'Digite seu nome',
                            // isCollapsed: true,
                          )),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'confirm_password'.i18n(),
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                          controller: confirmPasswordTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'Digite seu nome',
                            // isCollapsed: true,
                          )),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                          child: ElevatedButton(
                              child: Text('register'.i18n(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 3, 3))),
                              onPressed: () => {
                                    signupUseCase
                                        .signup(
                                      usernameTextFieldController.text,
                                      nameTextFieldController.text,
                                      birthTextFieldController.text,
                                      emailTextFieldController.text,
                                      passwordTextFieldController.text,
                                      confirmPasswordTextFieldController.text,
                                    )
                                        .then((msg) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('register_True'.i18n()),
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
                                                              LoginScreen()));
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             LoginScreen()));
                                    }).catchError((error) {
                                      print("error: $error");
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('register_False'.i18n()),
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
              ]),
              width: double.infinity,
              height: double.infinity,
            )));
  }
}
