import 'package:flutter/material.dart';
import 'package:pdm/src/Features/onboarding/components/body.dart';
import 'package:pdm/src/Features/onboarding/components/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
