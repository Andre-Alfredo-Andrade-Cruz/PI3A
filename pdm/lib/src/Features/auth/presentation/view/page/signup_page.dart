// import 'dart:indexed_db';
//mport 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:localization/localization.dart';
//import 'package:pdm/src/Features/auth/domain/repository/signup_screen_interface.dart';
import 'package:pdm/src/Features/auth/domain/usecase/signup_screen_usecase.dart';

//import '../../../data/repository/signup_screen_repository.dart';
//import '../../../domain/model/signup.dart';
import 'login_page.dart';
//import 'forgot_page.dart';

class SignupScreen extends StatefulWidget {

  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late ColorScheme _colors;

  late ThemeData _theme;

  var usernameTextFieldController = TextEditingController();

  var nameTextFieldController = TextEditingController();

  var birthTextFieldController = TextEditingController();

  var emailTextFieldController = TextEditingController();

  var passwordTextFieldController = TextEditingController();

  var confirmPasswordTextFieldController = TextEditingController();

  var signupUseCase = SignupUseCase();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'app_name'.i18n(),
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
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
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
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.only(left: 15.0),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'name'.i18n(),
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
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
                        style: TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.only(left: 15.0),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "E-mail:",
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                          controller: emailTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 16),
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
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'birth'.i18n(),
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                          readOnly: true,
                          onTap: () {
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990, 1),
                                lastDate: DateTime.now(),
                                builder: (context, picker) {
                                  return Theme(
                                    data: ThemeData.dark().copyWith(
                                      colorScheme: ColorScheme.dark(
                                        primary: Colors.deepPurple,
                                        onPrimary: Colors.white,
                                        surface:
                                            Color.fromARGB(255, 151, 205, 255),
                                        onSurface:
                                            Color.fromARGB(255, 16, 7, 68),
                                      ),
                                      dialogBackgroundColor:
                                          Color.fromARGB(255, 87, 215, 244),
                                    ),
                                    child: picker!,
                                  );
                                }).then((selectedDate) {
                              if (selectedDate != null) {
                                birthTextFieldController.text =
                                    selectedDate.toString().split(' ')[0];
                              }
                            });
                          },
                          controller: birthTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 16),
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
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'password'.i18n(),
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
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
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 16),
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
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      'confirm_password'.i18n(),
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                          obscureText: true,
                          controller: confirmPasswordTextFieldController,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 16),
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
                              child: Text('register'.i18n(),
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 255, 255))),
                              onPressed: () => {
                                    signupUseCase
                                        .signup(
                                      usernameTextFieldController.text,
                                      nameTextFieldController.text,
                                      emailTextFieldController.text,
                                      birthTextFieldController.text,
                                      passwordTextFieldController.text,
                                      confirmPasswordTextFieldController.text,
                                    )
                                        .then((msg) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('register_True'.i18n(), style: TextStyle(fontSize: 16)),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Text(""),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Ok', style: TextStyle(fontSize: 16)),
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
                                    }).catchError((error) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('register_False'.i18n(), style: TextStyle(fontSize: 16)),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[
                                                  Text("$error", style: TextStyle(fontSize: 16)),
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                child: const Text('Ok', style: TextStyle(fontSize: 16)),
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
                                  color: Color.fromRGBO(74, 250, 218, 1),
                                ),
                                primary: Color.fromRGBO(74, 250, 218, 1),
                              )),
                          width: double.infinity,
                          height: 40),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
              ]),
              width: double.infinity,
              height: double.infinity,
            )));
  }
}
