import 'package:flutter/material.dart';
import 'package:pdm/src/Features/onboarding/components/size_config.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.text2,
    this.image,
  }) : super(key: key);
  final String? text, text2, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(320),
          width: getProportionateScreenWidth(220),
        ),
        Spacer(flex: 2),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        Spacer(flex: 3),
        Text(
          text2!,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
