import 'package:flutter/material.dart';
import '../Widget/mainWidget.dart';
import 'SignUp.dart';
import 'Login.dart';

import '../Widget/My_Buttom.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcomechat';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                MyWidget(),
                const SizedBox(height: 50),
                const Text(
                  'Please Login Or Sign Up ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'IndieFlower',
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            MyButton(
              color: Colors.black,
              title: 'Login',
              onPressed: () {
                Navigator.pushNamed(context, 'sign');
              },
            ),
            MyButton(
              color: Colors.black,
              title: 'Sign Up',
              onPressed: () {
                Navigator.pushNamed(context, 'reg');
              },
            )
          ],
        ),
      ),
    );
  }
}
