import 'package:flutter/material.dart';

class animayedIconBack extends StatefulWidget {
  @override
  _animayedIconBackState createState() => _animayedIconBackState();
}

class _animayedIconBackState extends State<animayedIconBack>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.arrow_menu,
        progress: _animation,
      ),
      onPressed: () {
        Navigator.pop(context);
        // Handle icon press here
      },
    );
  }
}
