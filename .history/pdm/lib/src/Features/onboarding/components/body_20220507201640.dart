import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:pdm/src/Features/auth/presentation/view/page/login_screen.dart';
import 'package:pdm/src/Features/onboarding/components/default_button.dart.dart';
import 'package:pdm/src/Features/onboarding/components/size_config.dart';
import 'package:pdm/src/Features/onboarding/components/splash_content.dart';
import 'package:pdm/src/Features/onboarding/presentation/view/page/splash_screen.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Aprenda de onde quiser",
      "text2":
          "Aprenda gírias e palavras específicas de cada região do Brasil quando e onde quiser, tendo acesso sempre que necessário por meio do chat.",
      "image": "lib/assets/images/onboard1.png"
    },
    {
      "text": "Chatbot",
      "text2":
          "O chatbot realiza a tradução das palavras informadas a partir de redes sociais, ajuda na compreensão de forma confortavél para o usuário.",
      "image": "lib/assets/images/onboard2.png"
    },
    {
      "text": "Aprenda variedades linguísticas de forma divertida",
      "text2":
          "Aprendendo a variação da língua portuguesa e tendo total entendimento, acaba incentivando o aluno a usar o aplicativa cada vez mais.",
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
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  text: splashData[index]['text'],
                  text2: splashData[index]['text2'],
                  image: splashData[index]["image"],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(children: <Widget>[
                Spacer(),
                if (currentPage == 2)
                  DefaultButton(
                    text: "Começar",
                    press: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                  ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      splashData.length, (index) => buildDot(index: index)),
                ),
                Spacer(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 7),
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Color.fromARGB(225, 65, 62, 62)
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
