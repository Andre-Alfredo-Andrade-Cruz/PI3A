import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pingu Idiomas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: null,
            body: Container(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: ListView(children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 40)),
                Row(
                  children: [
                    Image.asset(
                      'lib/assets/images/logo.png',
                      width: 320,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "Nome:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      // height: 40,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        // style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          // hintText: 'Digite seu nome',
                          // isCollapsed: true,
                        ),
                      ),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "Data de nascimento:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'Digite seu nome',
                            // isCollapsed: true,
                          )),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "Email:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'Digite seu nome',
                            // isCollapsed: true,
                          )),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "Senha:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'Digite seu nome',
                            // isCollapsed: true,
                          )),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "Confirmar senha:",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                        child: Container(
                      height: 40,
                      child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            // hintText: 'Digite seu nome',
                            // isCollapsed: true,
                          )),
                    )),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                          child: ElevatedButton(
                            child: Text(
                              "Cadastrar",
                              style: TextStyle(color: Color.fromARGB(255, 255, 3, 3))
                            ),
                            onPressed: () => {print("pressed")},
                            style: ElevatedButton.styleFrom(
                                side: BorderSide(width: 2.0, color: Color.fromARGB(255, 0, 0, 0),),
                                primary: Color.fromARGB(255, 255, 255, 255),)
                          ),
                          width: double.infinity,
                          height: 40),
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ]),
              width: double.infinity,
              height: double.infinity,
            )));
  }
}
