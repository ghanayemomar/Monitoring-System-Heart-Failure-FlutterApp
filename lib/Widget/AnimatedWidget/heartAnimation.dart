import 'package:flutter/material.dart';

class heartAnimationIcon extends StatefulWidget {
  @override
  _heartAnimationIconState createState() => _heartAnimationIconState();
}

class _heartAnimationIconState extends State<heartAnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  double ratio = 1.0;
  late int x = 150;

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
    // Start the animation when the app first loads
    animationController.repeat();
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
                      // Set the color based on the x value
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
                    // Set the color based on the x value
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
