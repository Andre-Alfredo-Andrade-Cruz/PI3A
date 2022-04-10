import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.black,
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
