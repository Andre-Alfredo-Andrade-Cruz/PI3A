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
        child: Center(
          Padding(padding: EdgeInsets.only(bottom: 20)),
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                      child: ElevatedButton(
                          child: Text("Entrar",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 255, 3, 3))),
                          onPressed: () => {
                                loginUseCase
                                    .login(loginTextFieldController.text,
                                        passwordTextFieldController.text)
                                    .then((msg) {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Usuário logado com sucesso!'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text(""),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SplashScreen()));
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }).catchError((error) {
                                  print("error: $error");
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title:
                                            const Text('Erro ao fazer o login'),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: <Widget>[
                                              Text("$error"),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Ok'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                })
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
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
        ),
      ),
    );
  }
}
