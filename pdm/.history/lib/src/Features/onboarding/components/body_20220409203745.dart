import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:pdm/src/Features/onboarding/components/size_config.dart';

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
              child: Column(
                children: <Widget>[
                  Text(
                    "Estude de onde quiser",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(36),
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      "Estude quando e onde quiser, tendo acesso sempre que necessário por meio do conteúdo disponível.")
                ],
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
