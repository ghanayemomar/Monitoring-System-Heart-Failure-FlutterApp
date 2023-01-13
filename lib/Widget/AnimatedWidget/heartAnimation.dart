import 'package:flutter/material.dart';
import 'dart:async';

class heartAnimationIcon extends StatefulWidget {
  final double iconSize;
  final int x;
  const heartAnimationIcon(
      {super.key, required this.iconSize, required this.x});
  @override
  _heartAnimationIconState createState() => _heartAnimationIconState();
}

class _heartAnimationIconState extends State<heartAnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _iconScale = 1;
  Color _iconColor = Colors.blue;

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
    Timer.periodic(const Duration(seconds: 1), (timer) {
      updateColor(widget.x);
    });
  }

  void updateColor(int x) {
    setState(() {
      if (x < 110 && x > 60) {
        _iconColor = Colors.blueAccent;
      } else {
        _iconColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _iconScale,
      child: IconButton(
        icon: Icon(Icons.favorite_sharp, color: _iconColor),
        iconSize: widget.iconSize,
        onPressed: () {},
      ),
    );
  }
}
