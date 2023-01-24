import 'package:flutter/material.dart';
import 'package:oma/Screens/HomePageScreen.dart';
import 'package:oma/Screens/LoginScreen.dart';
import 'package:oma/Screens/constant.dart';
import 'package:oma/Screens/welcome.dart';
import '../../Screens/welcome.dart';

class AnimatedIconWelcome extends StatefulWidget {
  @override
  _AnimatedIconWelcomeState createState() => _AnimatedIconWelcomeState();
}

class _AnimatedIconWelcomeState extends State<AnimatedIconWelcome>
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
        icon: AnimatedIcons.menu_arrow,
        progress: _animation,
        color: Colors.blue,
      ),
      onPressed: () {
        Navigator.pushNamed(context, WelcomeScreen.screenRoute);
      },
    );
  }
}
