// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:oma/Widget/MainWidget/welcome_screen.dart';

class HomePageScreen extends StatefulWidget {
  static const String screenRoute = 'HomePageScreen';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(body: WelcomeScreenWidget());
  }
}
