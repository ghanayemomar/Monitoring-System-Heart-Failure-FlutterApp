import 'dart:math';

import 'package:flutter/material.dart';

class EcgAnimation extends StatefulWidget {
  @override
  _EcgAnimationState createState() => _EcgAnimationState();
}

class _EcgAnimationState extends State<EcgAnimation>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  List<Offset> points = [];

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..addListener(() {
            setState(() {
              points.add(Offset(points.length.toDouble(),
                  50 + 50 * sin(animationController.value * 6 * pi)));
            });
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.forward();
            }
          });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: CustomPaint(
        painter: EcgPainter(points),
      ),
    );
  }
}

class EcgPainter extends CustomPainter {
  final List<Offset> points;

  EcgPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
