import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class testHeart extends StatefulWidget {
  @override
  _testHeartState createState() => _testHeartState();
}

class _testHeartState extends State<testHeart>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double ratio = 1.0;
  late int x;

  // Initialize the animationController before the build method
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animationController.reset();
            }
          });
    // Generate a random integer between 0 and 200 (inclusive) and set it to x
    x = Random().nextInt(201);
    // Start the animation when the app first loads
    animationController.repeat();
    // Set up a timer to update the value of x every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        x = Random().nextInt(201);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Stack(
            children: [
              FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                    CurvedAnimation(
                        parent: animationController,
                        curve: Curves.fastLinearToSlowEaseIn)),
                child: SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(0.0, 0.0), end: Offset(0.0, -1.0))
                      .animate(CurvedAnimation(
                    curve: Curves.fastLinearToSlowEaseIn,
                    parent: animationController,
                  )),
                  child: Container(
                    width: 100,
                    height: 100,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.favorite,
                      // Set the color based on the value of x
                      color: x >= 100 ? Colors.green : Colors.red,
                      size: 100 * ratio,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTapDown: (d) {
                  setState(() {
                    ratio = 0.9;
                  });
                },
                onTapUp: (d) {
                  setState(() {
                    ratio = 1.0;
                  });
                  // No need to manually start the animation here since it's already running
                },
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.favorite,
                    // Set the color based on the value of x
                    color: x >= 100 ? Colors.green : Colors.red,
                    size: 100 * ratio,
                  ),
                ),
              ),
              GestureDetector(
                onTapDown: (d) {
                  setState(() {
                    ratio = 0.1;
                  });
                },
                onTapUp: (d) {
                  setState(() {
                    ratio = 1.0;
                  });
                  // No need to manually start the animation here since it's already running
                },
                child: Container(
                  width: 100,
                  height: 100,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.favorite,
                    // Set the color based on the value of x
                    color: x >= 100 ? Colors.green : Colors.red,
                    size: 100 * ratio,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
