import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pdm/src/google_maps.dart';
import 'package:pdm/src/DialogFlow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Home')), body: Center(
      child: SpinKitCircle(
        size: 140
      )
    ));
  }
}
