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
    String test = 'onboard_title1'.i18n();
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Text(
                  test,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(36),
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('onboard_body1'.i18n())
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(),
          )
        ],
      ),
    );
  }
}
