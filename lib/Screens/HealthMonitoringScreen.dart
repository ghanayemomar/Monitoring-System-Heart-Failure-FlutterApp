// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oma/Widget/AnimatedWidget/AnimatedIconBack.dart';
import 'package:oma/Widget/HealthMonitoringWidget.dart';
import '../Screens/constant.dart';

class HealthMonirtoring extends StatefulWidget {
  static const screenRoute = 'HealthMonitoring';
  // final int value = 100;
  const HealthMonirtoring({super.key});

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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [mSecondBackgroundColor, mSecondBackgroundColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            HealthMonitoringWidget(
              iconSize: 145,
              x: 100,
            ),

            // LineChartSample()
          ],
        ),
      ),
    );
  }
}
