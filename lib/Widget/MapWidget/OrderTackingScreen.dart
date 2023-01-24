// // ignore_for_file: avoid_function_literals_in_foreach_calls

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import './Constant.dart';

// class OrderTrackingPage extends StatefulWidget {
//   static const String screenRoute = 'OrderTrackingPage';
//   @override
//   State<OrderTrackingPage> createState() => _OrderTrackingPageState();
// }

// class _OrderTrackingPageState extends State<OrderTrackingPage> {
//   final Completer<GoogleMapController> _controller = Completer();

//   static const LatLng sourceLocation = LatLng(32.3868701192, 35.3209670495);

//   static const LatLng destination = LatLng(37.5532252676, -121.91464659);

//   List<LatLng> polylineCoordinates = [];

//   LocationData? currentLocation;

//   void getCurrentLocation() {
//     Location location = Location();
//     location.getLocation().then(
//       (location) {
//         currentLocation = location;
//       },
//     );
//   }

//   void getPolyPoints() async {
//     PolylinePoints polylinePoints = PolylinePoints();
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//       'AIzaSyDJaRPutmMvvnmHvdWLMLhg',
//       PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
//       PointLatLng(destination.latitude, destination.longitude),
//     );
//     if (result.points.isNotEmpty) {
//       result.points.forEach(
//         (PointLatLng point) => polylineCoordinates.add(
//           LatLng(point.latitude, point.longitude),
//         ),
//       );
//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     getCurrentLocation();
//     // getPolyPoints();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Center(
//           child: const Text(
//             "Track The User",
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//             ),
//           ),
//         ),
//       ),
//       body: GoogleMap(
//         mapType: MapType.hybrid,
//         // ignore: prefer_const_constructors
//         initialCameraPosition: CameraPosition(
//           target:
//               LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
//           zoom: 13.5,
//         ),
//         polylines: {
//           Polyline(
//             polylineId: const PolylineId("route"),
//             points: polylineCoordinates,
//             color: Colors.blue,
//             width: 6,
//           )
//         },
//         // markers: {
//         //   Marker(
//         //     markerId: const MarkerId("currentLocation"),
//         //     position: LatLng(
//         //       currentLocation!.latitude!,
//         //       currentLocation!.longitude!,
//         //     ),
//         //   ),
//         // const Marker(
//         //   markerId: MarkerId("source"),
//         //   position: sourceLocation,
//         // ),
//         // const Marker(
//         //   markerId: MarkerId("destination"),
//         //   position: destination,
//         // ),
//         // },
//       ),
//     );
//   }
// }
