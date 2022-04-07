import 'package:flutter/material.dart';
// import 'package:pdm/view/page/welcome_screen.dart';

import '../src/view/page/forgot_page.dart';
import '../src/view/page/login_page.dart';
import '../src/view/page/signup_page.dart';

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
        home: LoginPage());
  }
}
