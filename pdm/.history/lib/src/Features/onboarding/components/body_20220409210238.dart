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
  List<Map<String, String>> splashData = [
    {
      "text":
          "Estude quando e onde quiser, tendo acesso sempre que necessário por meio do conteúdo disponível.",
      "image": "assets\images\onboard1.png"
    },
    {
      "text":
          "O material online do idioma selecionado, por tempo indeterminado, ajuda na compreensão do idioma de forma confortavél para o usuário.",
      "image": "assets\images\onboard2.png"
    },
    {
      "text":
          "O aluno tendo total domínio sobre o seu aprendizado, estudando quando quiser, sem aulas monotonas e cansativas, acaba incentivando o aluno a se dedicar cada vez mais.",
      "image": "assets\images\onboard3.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text'],
                  image: splashData[index]["image"],
                ),
              ),
            ),
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
  final String text, text2, image;

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
        Spacer(flex: 2),
        Text(
          text,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
