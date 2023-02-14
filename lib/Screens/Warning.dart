import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:oma/Screens/HealthMonitoringScreen.dart';
import 'package:oma/Screens/constant.dart';
import 'package:oma/Widget/AnimatedWidget/AnimatedIconBack.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class Warning extends StatefulWidget {
  static const screenRoute = 'Warning';
  @override
  _WarningState createState() => _WarningState();
}

class _WarningState extends State<Warning> {
  // var _data;
  late String x;
  int DisplayOneTime = 1;

  ///int x = 80;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: databaseReference.child("data").onValue,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError)
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        if (snapshot.connectionState == ConnectionState.waiting)
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        if (snapshot.hasData && snapshot.data.snapshot.value != null) {
          x = snapshot.data.snapshot.value.toString();
          int NewX = int.parse(x);
          if (NewX > 100 || NewX < 60) {
            Future.delayed(Duration(seconds: 0), () {
              if (DisplayOneTime != 0) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        'WARNING!',
                        style: TextStyle(
                            color: Colors.red, fontSize: 22, letterSpacing: 2),
                      ),
                      content: Text(
                        'The state is abnormal',
                        style: TextStyle(fontSize: 20),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'OK',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                DisplayOneTime--;
              }
            });
          }
          return HealthMonirtoring(
            x: NewX,
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: animayedIconBack(),
              backgroundColor: mSecondBackgroundColor,
              elevation: 0,
              title: const Text(
                "Health Monitoring",
                style: TextStyle(color: mPrimaryTextColor, fontSize: 30),
              ),
              centerTitle: true,
            ),
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
