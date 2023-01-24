import 'package:flutter/material.dart';
import 'package:oma/Drawer/navigation_drawer.dart';

class ProfileAnimatedDrawer extends StatefulWidget {
  @override
  ProfileAnimatedDrawerState createState() => ProfileAnimatedDrawerState();
}

class ProfileAnimatedDrawerState extends State<ProfileAnimatedDrawer>
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
        color: Colors.white,
        icon: AnimatedIcons.arrow_menu,
        progress: _animation,
        size: 30,
      ),
      onPressed: () {
        Navigator.pushNamed(context, NavigationDrawer.screenRoute);
        // Handle icon press here
      },
    );
  }
}
