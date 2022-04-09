import 'package:flutter/material.dart';
import 'package:pdm/src/Screens/Welcome/welcome_screen.dart';

import 'Features/ForgotPassword/forgot_screen.dart';
import 'Features/Signup/signup_screen.dart';
import 'Features/Login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pingu Idiomas',
        home: LoginScreen());
  }
}
