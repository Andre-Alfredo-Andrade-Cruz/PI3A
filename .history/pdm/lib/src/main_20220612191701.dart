import 'package:flutter/material.dart';
import 'package:pdm/src/Features/auth/presentation/view/page/home_page.dart';
import 'package:pdm/src/Features/onboarding/presentation/view/page/splash_screen.dart';
// import 'package:pdm/Screens/Welcome/welcome_screen.dart';

import 'Features/auth/presentation/view/page/login_page.dart';

// import 'Screens/ForgotPassword/forgot_screen.dart';
// import 'Screens/Login/login_screen.dart';
// import 'Screens/Signup/signup_screen.dart';

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
        // home: SplashScreen()); //
        home: LoginScreen());
  }
}
