import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:oma/Screens/OnBoardScreen.dart';
import 'package:oma/Screens/welcome.dart';

class SafeDriveScreen extends StatefulWidget {
  @override
  _SafeDriveScreenState createState() => _SafeDriveScreenState();
}

class _SafeDriveScreenState extends State<SafeDriveScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: 2 * math.pi).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomeScreen(),
            ),
          );
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue,
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            child: Container(
              width: 400,
              height: 400,
            ),
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: CirclePainter(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Safe Drive',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 100, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
