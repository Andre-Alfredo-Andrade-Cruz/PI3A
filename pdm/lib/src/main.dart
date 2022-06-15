// @dart=2.9
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:pdm/Screens/Welcome/welcome_screen.dart';

import 'package:localization/localization.dart';
import 'Features/auth/presentation/view/page/login_page.dart';
//import 'package:pdm/src/Features/onboarding/presentation/view/page/splash_screen.dart';

// import 'Screens/ForgotPassword/forgot_screen.dart';
// import 'Screens/Login/login_screen.dart';
// import 'Screens/Signup/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['lib/assets/i18n'];

    return MaterialApp(

      scrollBehavior: AppScrollBehavior(),

      title: 'app_name'.i18n(),
      
      localizationsDelegates: [
      
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LocalJsonLocalization.delegate
      
      ],
      
      supportedLocales: const [
        
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      
      ],

      //home: SplashScreen()); //
      home: LoginScreen());
  
  }

}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
