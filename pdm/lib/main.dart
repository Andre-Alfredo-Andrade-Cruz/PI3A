import 'package:flutter/material.dart';
import 'package:pdm/Screens/Welcome/welcome_screen.dart';

import 'Screens/Login/login_screen.dart';

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

