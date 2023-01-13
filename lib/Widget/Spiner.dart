import 'dart:async';
import 'package:flutter/material.dart';
import 'package:oma/Screens/Welcome.dart';

class Spiner extends StatefulWidget {
  static const String screenRoute = 'Splash_Screen';

  @override
  _SpinerState createState() => _SpinerState();
}

class _SpinerState extends State<Spiner> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Column(
            //   children: [
            //     Image.asset(
            //       "images/lo1.png",
            //       height: 300.0,
            //       width: 300.0,
            //     ),
            //     const Text(
            //       "SafeHealthCare",
            //       textAlign: TextAlign.center,
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 58.0,
            //           fontFamily: 'IndieFlower'),
            //     ),
            //   ],
            // ),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
