import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueGrey[50],
        child: ListView(children: <Widget>[
            Padding(padding: EdgeInsets.only(bottom: 40)),
            Row(
          children: 
                        [SizedBox(
                        child: ElevatedButton(
                            child: Text("chat",
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
                      ],
            ),
           /* Padding(padding: EdgeInsets.only(bottom: 50)),
            Row(
          children: 
                        [SizedBox(
                        child: ElevatedButton(
                            child: Text("chatbot",
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
                      ],
            ),*/
        ]),
      ),
    );
  }
}
