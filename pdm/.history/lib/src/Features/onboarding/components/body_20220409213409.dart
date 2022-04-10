import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:pdm/src/Features/onboarding/components/size_config.dart';
import 'package:pdm/src/Features/onboarding/components/splash_content.dart';
import 'package:pdm/src/Features/onboarding/presentation/view/page/splash_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<String, String>> splashData = [
    {
      "text": "Estude de onde quiser",
      "text2":
          "Estude quando e onde quiser, tendo acesso sempre que necessário por meio do conteúdo disponível.",
      "image": "lib/assets/images/onboard1.png"
    },
    {
      "text": "Material online",
      "text2":
          "O material online do idioma selecionado, por tempo indeterminado, ajuda na compreensão do idioma de forma confortavél para o usuário.",
      "image": "lib/assets/images/onboard2.png"
    },
    {
      "text": "Aprenda idiomas de forma divertida",
      "text2":
          "O aluno tendo total domínio sobre o seu aprendizado, estudando quando quiser, sem aulas monotonas e cansativas, acaba incentivando o aluno a se dedicar cada vez mais.",
      "image": "lib/assets/images/onboard3.png"
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
              flex: 2,
              child: PageView.builder(
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text'],
                  text2: splashData[index]['text2'],
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
