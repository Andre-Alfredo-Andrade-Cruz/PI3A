import 'dart:html';

import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:pdm/src/Features/onboarding/components/size_config.dart';
import 'package:pdm/src/Features/onboarding/presentation/view/page/splash_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(itemBuilder: (context, index) => SplashContent(
                  text: "Estude de onde quiser",
                  image: "assets\images\onboard1.png"),
            ),),),
            Expanded(
              flex: 2,
              child: SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({Key key, this.text, this.image}) : super(key: key);
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Spacer(),
        Image(
          image: image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
        Spacer(flex: 2),
        Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
            "Estude quando e onde quiser, tendo acesso sempre que necessário por meio do conteúdo disponível.")
      ],
    );
  }
}
