// ignore_for_file: prefer_typing_uninitialized_variables, avoid_single_cascade_in_expression_statements, use_build_context_synchronously, prefer_const_constructors, unnecessary_null_comparison
import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:oma/Widget/AnimatedWidget/AnimatedIconBack.dart';

class Location extends StatefulWidget {
  static const String screenRoute = 'LocationServices';

  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => LocationState();
}

class LocationState extends State<Location> {
  Position c1 = Position(
      latitude: 37.4219999,
      longitude: -122.0840575,
      timestamp: DateTime.now(),
      accuracy: 30,
      altitude: 10,
      heading: 45,
      speed: 20,
      speedAccuracy: 15);

  CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.4219999, -122.0840575),
      zoom: 14.4746,
      tilt: 59.4407,
      bearing: 193.9);

  var lat;
  var long;

  Future getper() async {
    bool services;
    LocationPermission per; //for permiation

    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
        title: 'services',
        body: const Text('services not enabelled'),
        context: context,
      )..show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      Navigator.pushNamed(context, 'backmap');
    }
    return per;
  }

  Future<void> getLatAndLong() async {
    c1 = await Geolocator.getCurrentPosition().then((value) => value);

    print(
        "--------------------------------------------------------------------------------");
    print(c1.toString());
    lat = c1.latitude;
    long = c1.longitude;

    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );

    setState(() {}); //عشان ياخد القيم بعد التحديثات
  }

  @override
  void initState() {
    getper();
    getLatAndLong();
    super.initState();
  }

  late GoogleMapController gmc;
  late Set<Marker> mymarker = {
    Marker(
        markerId: MarkerId('3'),
        infoWindow: InfoWindow(title: "Current Location"),
        position: LatLng(lat, long)),
    Marker(
        markerId: MarkerId('1'),
        infoWindow: InfoWindow(title: "فرع 1"),
        position: LatLng(32.239075, 35.245778)),
    Marker(
        markerId: MarkerId('2'),
        infoWindow: InfoWindow(title: "فرع2"),
        position: LatLng(32.225163, 35.241482)),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.
        leading: animayedIconBack(),
        title: Text('Current Location'),
        centerTitle: true,
      ),
      body: Stack(children: [
        _kGooglePlex == null || long == null || lat == null || c1 == null
            ? Center(child: CircularProgressIndicator())
            : SizedBox(
                height: double.infinity,
                width: 400,
                child: GoogleMap(
                  markers: mymarker,
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    gmc = controller;
                  },
                ),
              ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                LatLng latLng = LatLng(32.239075, 35.245778);
                gmc.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(target: latLng, zoom: 17)));
              },
              child: Text(
                "Go To Hospital",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(
              width: double.infinity,
            ),
          ],
        ),
      ]),
    );
  }
}
