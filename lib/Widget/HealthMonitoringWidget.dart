import 'package:flutter/material.dart';
import 'dart:async';
import '../Widget/MainWidget/constant.dart';

//Stream<int> stream;
class HealthMonitoringWidget extends StatefulWidget {
  final int x;
  const HealthMonitoringWidget({super.key, required this.x});
  @override
  _HealthMonitoringWidgetState createState() => _HealthMonitoringWidgetState();
}

class _HealthMonitoringWidgetState extends State<HealthMonitoringWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _iconScale = 1;
  Color color = mSecondBackgroundColor;
  String text = 'normal';
  int heartSpeed = 1100;
  late IconData icon;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1100), vsync: this);
    _animationController.addListener(() {
      setState(() {
        _iconScale = 1.0 + _animationController.value * 0.4;
      });
    });
    _animationController.repeat(reverse: true);
    // Set up a timer to check the value of x every second
    Timer.periodic(const Duration(microseconds: 1), (timer) {
      updateColor(widget.x);
    });
  }

  void updateColor(int x) {
    setState(() {
      if (x < 110 && x > 60) {
        color = Colors.blueAccent;
        text = 'Normal';
        icon = Icons.favorite;
      } else {
        color = Colors.red;
        text = 'Abnormal';
        icon = Icons.heart_broken_sharp;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 90),
        Transform.scale(
          scale: _iconScale,
          child: IconButton(
            icon: Icon(icon, color: color),
            iconSize: 145,
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'BPN: ' + widget.x.toString(),
            textAlign: TextAlign.end,
            style: TextStyle(
                color: color,
                fontFamily: 'Poppins',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 0),
          ),
        ),
        Card(
          elevation: 20,
          // surfaceTintColor: Colors.amber,
          shadowColor: color,
          color: mSecondBackgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: mSecondBackgroundColor),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(
                letterSpacing: 5,
                fontSize: 40,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
