// import 'package:flutter/material.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// // class Notification extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter FCM Example',
// //       home: MyNotifi(),
// //     );
// //   }
// // }

// class MyNotifi extends StatefulWidget {
//   @override
//   _MyNotifiState createState() => _MyNotifiState();
// }

// class _MyNotifiState extends State<MyNotifi> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   String token =
//       'dYfsj1xaTPGIjQZ_COwpLv:APA91bFkhY_bgt8_9GOlv8EAy0CJJK1_yT1L_gP-L7xiLqPFxRjuDoemKyx3b2FSnHJiiAEnNajlX1FrnPVSs-XS8mjy_ZAl35x7FPWY7RyV9WyrbJQri1qSdlMtsMiYIUCcVIDMXTja';

//   @override
//   void initState() {
//     super.initState();
//     // _firebaseMessaging(
//     onMessage:
//     (Map<String, dynamic> message) async {
//       print("onMessage: $message");
//       // Handle your message here
//     };
//     onLaunch:
//     (Map<String, dynamic> message) async {
//       print("onLaunch: $message");
//       // Handle your message here
//     };
//     onResume:
//     (Map<String, dynamic> message) async {
//       print("onResume: $message");
// // Handle your message here
//     };
//     // );
//     _firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);

//     _firebaseMessaging.getToken().then((token) {
//       assert(token != null);
//       setState(() {
//         this.token = token as String;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter FCM Example'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('FCM token: $token'),
//           ],
//         ),
//       ),
//     );
//   }
// }
