import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:localization/localization.dart';
import 'package:pdm/src/google_maps.dart';
import 'package:pdm/src/DialogFlow.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Container(
          padding: EdgeInsets.only(left: 40, right: 40),
          child: ListView(children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 40)),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                      child: ElevatedButton(
                          child: Text("ChatBot",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 3, 3))),
                          onPressed: () => {
                                              //Navigator.of(context).pop();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DialogFlow()))
                                            },
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            primary: Color.fromARGB(255, 255, 255, 255),
                          )),
                      width: double.infinity,
                      height: 40),
              ),
            ]
          ),
          Padding(padding: EdgeInsets.only(bottom: 40)),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                      child: ElevatedButton(
                          child: Text('map'.i18n(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 3, 3))),
                          onPressed: () => {
                                              //Navigator.of(context).pop();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          GoogleMAPS()))
                                            },
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            primary: Color.fromARGB(255, 255, 255, 255),
                          )),
                      width: double.infinity,
                      height: 40),
              ),
            ]
          ),
          Padding(padding: EdgeInsets.only(bottom: 40)),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                      child: ElevatedButton(
                          child: Text('Slang'.i18n(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 3, 3))),
                          onPressed: () => {},
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                            primary: Color.fromARGB(255, 255, 255, 255),
                          )),
                      width: double.infinity,
                      height: 40),
              ),
            ]
          ),
        ]),
      ),
    );
  }
}
