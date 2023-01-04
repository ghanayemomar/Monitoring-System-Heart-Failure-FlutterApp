import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:oma/Widget/AnimatedWidget/AnimatedIconBack.dart';
import 'package:oma/Widget/AnimatedWidget/BPN.dart';
import 'package:oma/Widget/AnimatedWidget/animated.dart';
import 'package:oma/Widget/AnimatedWidget/ecgWidget.dart';
import 'package:oma/Widget/AnimatedWidget/heartAnimation.dart';
import '../Screens/constant.dart';

class HealthMonirtoring extends StatefulWidget {
  static const screenRoute = 'HealthMonitoring';
  const HealthMonirtoring({super.key});

  @override
  State<HealthMonirtoring> createState() => _HealthMonirtoringState();
}

class _HealthMonirtoringState extends State<HealthMonirtoring> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: mSecondBackgroundColor,
      //   leading: animayedIconBack(),
      //   elevation: 0,
      // ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [mSecondBackgroundColor, mSecondBackgroundColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(children: [
          Container(
              padding: EdgeInsets.only(top: 50, left: 10),
              alignment: Alignment.bottomLeft,
              child: animayedIconBack()),
          SizedBox(
            height: 5,
          ),
          const Text(
            "Health Monitoring",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: mPrimaryTextColor),
          ),
          SizedBox(
            height: 80,
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Image.asset('images/Group 10015.png'),
              Positioned(
                  top: 30,
                  child: heartAnimationIcon(
                    iconSize: 145,
                  )),
              const Positioned(
                top: 190,
                child: Text(
                  " 66 BPN",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
    ;
  }
}
