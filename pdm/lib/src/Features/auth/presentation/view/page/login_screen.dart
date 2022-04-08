import 'dart:indexed_db';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import './forgot_screen.dart';
import './signup_screen.dart';
import './../../viewmodel/login_screen_viewmodel.dart';

class LoginScreen extends StatelessWidget{
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ModularState<LoginScreen, LoginScreenViewModular>{
  late ColorScheme _colors;
  late ThemeData _theme;

  Widget get _loginIndicator => Visibility(
    child: const LinearProgressIndicator(
      backgroundColor: Colors.white,
    ),
    visible: store.isLoading,
  );

  Widget get _username => widget.createFormField(
    title: 'username'.i18n(),
    theme: _theme,
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.next,
    hint: 'username_hint'.i18n(),
    enabled: !store.isLoading,
    errorText: store.error.username,
    onChange: (value) => store.username = value,
  );

  Widget get _password => widget.createFormField(
    title: 'password'.i18n(),
    theme: _theme,
    keyboardType: TextInputType.text,
    obscureText: true,
    hint: 'password_hint'.i18n(),
    enabled: !store.isLoading,
    errorText: store.error.password,
    onChange: (value) => store.password = value,
  );

  Widget get _loginButton => Container(
    width: double.infinity,
    height: 40,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: 2.0,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        primary: Color.fromARGB(255, 255, 255, 255),
      ),
      onPressed: store.isLoading ? null : store.login,
      child: Text('login'.i18n()),
    ),
  );

  Widget get _forgotPasswordButton = ContainerText(
    width: 200,
    height: 30,
    child: TextButton(
      style: TextStyle(
        color: Color.fromARGB(255, 255, 220, 23)),
      ),
      onPressed: store.isLoading ? null : () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ForgotScreen())
        );
      },
      child: Text('forgot_password'.i18n()),
    ),
  );

  Widget get _singUp => ContainerText(
    width: 200,
    height: 30,
    child: TextButton(
      style: TextStyle(
        color: Color.fromARGB(255, 255, 220, 23),
      ),
      onPressed: () => {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => SignupScreen())
        ), 
      },
    ),
    child: Text('signup'.i18n()),
  );
}

@override 
Widget buil(BuildContext context){
  _theme = Theme.of(context);
  _colors = _theme.colorScheme;

  return MaterialApp(
    appBar: AppBar(title: const Text('Pingu Idiomas')),
    body: Container(
      child: ListView(
        child: Observer(builder: (_)){
          return Form(
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _loadingIndicator,
                  const SizedBox(height: 5),
                  _username,
                  _password,
                  _loginButton,
                  _forgotPasswordButton,
                  _signUp
                ],
              ),
          );
        },
      ),
    ),
  );
}