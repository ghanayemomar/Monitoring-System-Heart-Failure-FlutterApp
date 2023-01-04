import 'package:flutter/material.dart';

class heartAnimationIcon extends StatefulWidget {
  final double iconSize;
  const heartAnimationIcon({super.key, required this.iconSize});
  @override
  _heartAnimationIconState createState() => _heartAnimationIconState();
}

int x = 50;

class _heartAnimationIconState extends State<heartAnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double _iconScale = 1;
  Color _iconColor = Colors.red;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1100), vsync: this);
    _animationController
      ..addListener(() {
        setState(() {
          _iconScale = 1.0 + _animationController.value * 0.4;
        });
      });
    _animationController.repeat(reverse: true);
  }

  void updateColor(int x) {
    setState(() {
      if (x < 110 && x > 60) {
        _iconColor = Colors.green;
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
