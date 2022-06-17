// import 'dart:indexed_db';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'login_page.dart';
import 'signup_page.dart';
// import './../../viewmodel/forgot_screen_viewmodel.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({Key? key}) : super(key: key);

  // @override
  // State<ForgotScreen> createState() => _ForgotScreenState();

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
                      width: 300,
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                // Padding(padding: EdgeInsets.only(bottom: 10)),
                // Row(
                //   children: [
                //     Text(
                //       "Nome:",
                //       style: TextStyle(color: Color.fromARGB(255, 255, 26, 1)),
                //     ),
                //   ],
                // ),
                // Padding(padding: EdgeInsets.only(bottom: 10)),
                // Row(
                //   children: [
                //     Flexible(
                //       child: TextField(
                //           decoration: InputDecoration(
                //         border: OutlineInputBorder(
                //             borderSide: BorderSide(
                //                 color: Color.fromARGB(255, 246, 0, 4),
                //                 width: 2.0)),
                //         // hintText: 'Digite seu email',
                //       )),
                //     ),
                //   ],
                //   mainAxisAlignment: MainAxisAlignment.center,
                // ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Text(
                      "E-mail:",
                      style: TextStyle(color: Color.fromARGB(255, 255, 26, 1)),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // hintText: 'Digite sua senha',
                      )),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Row(
                  children: [
                    Flexible(
                      child: SizedBox(
                          child: ElevatedButton(
                              child: Text("Confirmar",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255))),
                              onPressed: () => {print("pressed")},
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 0, 0, 0),
                              )),
                          // width: double.infinity,
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

// class _ForgotScreenState extends ModularState<ForgotScreen,ForgotScreenViewModular>{
//   late ColorScheme _colors;
//   late ThemeData _theme;

//   Widget get _forgotIndicator => Visibility(
//     child: const LinearProfressIndicator(
//       backgroundColor: Colors.white,
//     ),
//     visible: store.isLoading,
//   );

//   Widget get _name => widget.createFormField(
//     title: 'name'.i18n(),
//     theme: _theme,
//     keyboardType: TextInputType.text,
//     textInputAction: TextInputAction.next,
//     hint: 'name_hint'.i18n(),
//     enabled: !store.isLoading,
//     errorText: store.error.name,
//     onChange: (value) => store.name = value,
//   );

//   Widget get _username => widget.createFormField(
//     title: 'username'.i18n(),
//     theme: _theme,
//     keyboardType: TextInputType.emailAddress,
//     textInputAction: TextInputAction.next,
//     hint: 'username_hint'.i18n(),
//     enabled: !store.isLoading,
//     errorText: store.error.username,
//     onChange: (value) => store.username = value,
//   );

//   Widget get _confirmButton => Container(
//     width: double.infinity,
//     height: 40,
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: Color.fromARGB(255, 0, 0, 0),
//       ),
//       onPressed: store.isLoading ? null : store.login,
//       child: Text('confirm'.i18n()),
//     ),
//   );
// }
