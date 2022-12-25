import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  static const String screenRoute = 'SimpleMapScreen';
  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition initalPostion =
      CameraPosition(target: LatLng(37.1, -108.2), zoom: 14.5);

  static const CameraPosition targetPosition = CameraPosition(
    target: LatLng(33.3, 108.1),
    zoom: 14.8,
    bearing: 192.0,
    tilt: 60,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Location"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initalPostion,
        mapType: MapType.none,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("To The lake!"),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> gotoLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
