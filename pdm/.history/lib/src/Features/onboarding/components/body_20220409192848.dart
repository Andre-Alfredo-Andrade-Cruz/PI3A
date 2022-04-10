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
    LocalJsonLocalization.delegate.directories = ['lib/assets/i18n'];
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Column(
            children: <Widget>[
              Text(
                'onboard_title1'.i18n(),
                style: TextStyle(fontStyle: getProportionateScreenWidth(36)),
              )
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(),
        )
      ],
    );
  }
}
