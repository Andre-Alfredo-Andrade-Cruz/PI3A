import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Google Maps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Google Maps'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(0.000000,0.000000);
  final Map<String, Marker> _markers = {};
  final Set<Circle> _circles = HashSet();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      addMarker('', _center, 'oceano-atlantico', '');
      addCircle('oceano-atlantico-circle',_center,100);
    });
  }

  void addMarker (String id, LatLng position, String title, String snippet) {
    final oceanoAtlanticoMarker = Marker(
      markerId: MarkerId(id),
      position: _center,
      infoWindow: InfoWindow(
        title: title,
        snippet: snippet,
      )
    );
    _markers[id] = oceanoAtlanticoMarker;
  }

  void addCircle(String id, LatLng point, double radius) {
    final circle = Circle(
      circleId: CircleId(id),
      center: point,
      radius: radius,
      fillColor: Colors.blueGrey,
      strokeWidth: 3,
      strokeColor: Colors.blueAccent
    );
    _circles.add(circle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 14.0,
        ),
        markers: _markers.values.toSet(),
        circles: _circles,
        onLongPress: (latlng) => setState(() {
          addCircle(Random().nextInt(10000).toString(), latlng, 100);
        }),
      ),
    );
  }
}