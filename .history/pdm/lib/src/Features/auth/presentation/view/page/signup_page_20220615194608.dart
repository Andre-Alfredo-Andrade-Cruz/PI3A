// import 'dart:indexed_db';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdm/src/Features/auth/domain/repository/signup_screen_interface.dart';
import 'package:pdm/src/Features/auth/domain/usecase/signup_screen_usecase.dart';

import '../../../data/repository/signup_screen_repository.dart';
import '../../../domain/model/signup.dart';
import 'login_page.dart';
import 'forgot_page.dart';
// import './../../viewmodel/signup_screen_viewmodel.dart';

// class SignupScreen extends StatelessWidget{
//   const SignupScreen({Key? key}) : super(key: key);

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

class SignupScreen extends StatelessWidget {
// class _SignupScreenState extends ModularState<SignupScreen,SignupScreenViewModular>{
  late ColorScheme _colors;
  late ThemeData _theme;

  // Widget get _signupIndicator => Visibility(
  //   child: const LinearProfressIndicator(
  //     backgroundColor: Colors.white,
  //   ),
  //   visible: store.isLoading,
  // );

  // Widget get _name => widget.createFormField(
  //   title: 'name'.i18n(),
  //   theme: _theme,
  //   keyboardType: TextInputType.text,
  //   textInputAction: TextInputAction.next,
  //   hint: 'name_hint'.i18n(),
  //   enabled: !store.isLoading,
  //   errorText: store.error.name,
  //   onChange: (value) => store.name = value,
  // );

  // Widget get _birth => widget.createFormField(
  //   title: 'birth'.i18n(),
  //   theme: _theme,
  //   keyboardType: TextInputType.date,
  //   textInputAction: TextInputAction.next,
  //   hint: 'birth_hint'.i18n(),
  //   enabled: !store.isLoading,
  //   errorText: store.error.birth,
  //   onChange: (value) => store.birth = value,
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

  //  Widget get _confirm_password => widget.createFormField(
  //   title: 'confirm_password'.i18n(),
  //   theme: _theme,
  //   keyboardType: TextInputType.text,
  //   obscureText: true,
  //   hint: 'confirm_password_hint'.i18n(),
  //   enabled: !store.isLoading,
  //   errorText: store.error.confirm_password,
  //   onChange: (value) => store.confirm_password = value,
  // );

  //  Widget get _registerButton => Container(
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
  //     onPressed: store.isLoading ? null : store.register,
  //     child: Text('register'.i18n()),
  //   ),
  // );

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
                      "Usuario:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      // height: 40,
                      child: TextField(
                        controller: usernameTextFieldController,
                        textAlignVertical: TextAlignVertical.center,
                        // style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          // hintText: 'Digite seu nome',
                          // isCollapsed: true,
                        ),
                      ),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "Nome:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      // height: 40,
                      child: TextField(
                        controller: nameTextFieldController,
                        textAlignVertical: TextAlignVertical.center,
                        // style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          // hintText: 'Digite seu nome',
                          // isCollapsed: true,
                        ),
                      ),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "Email:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
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
                      "Data de nascimento:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      child: TextField(
                          maxLength,: false,
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
                                        surface: Colors.pink,
                                        onSurface: Colors.yellow,
                                      ),
                                      dialogBackgroundColor: Colors.green[900],
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
                      "Senha:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      child: TextField(
                          obscureText: true,
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
                      "Confirmar senha:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      child: TextField(
                          obscureText: true,
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
                              child: Text("Cadastrar",
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
                                            title: const Text(
                                                'Usuário cadastrado com sucesso!'),
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
                                            title: const Text(
                                                'Erro ao fazer o cadastro'),
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
