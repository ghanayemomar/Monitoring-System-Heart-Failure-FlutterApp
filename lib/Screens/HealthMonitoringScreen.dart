// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oma/Widget/AnimatedWidget/AnimatedIconBack.dart';
import 'package:oma/Widget/HealthMonitoringWidget.dart';
import '../Screens/constant.dart';

class HealthMonirtoring extends StatefulWidget {
  static const screenRoute = 'HealthMonitoring';
  final int x;
  // final int value = 100;
  const HealthMonirtoring({super.key, required this.x});

  @override
  State<HealthMonirtoring> createState() => _HealthMonirtoringState();
}

class _HealthMonirtoringState extends State<HealthMonirtoring> {
  @override
  void initState() {
    animayedIconBack();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [mSecondBackgroundColor, mSecondBackgroundColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: HealthMonitoringWidget(
            x: widget.x,
          ),
        ),
      ),
    );
  }
}
