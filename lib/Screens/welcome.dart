import 'package:flutter/material.dart';

import './SignUpScreen.dart';
import './LoginScreen.dart';
import 'package:oma/Utils/color_utils.dart';

import '../Widget/My_Buttom.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'Welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final FocusNode _focusNode1 = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      if (!_focusNode1.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          _focusNode1.unfocus();
        },
        child: Container(
          padding: EdgeInsets.only(top: 300),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4"),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //  crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Please Login Or Sign Up ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    // fontFamily: 'IndieFlower',
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 50),
                MyButton(
                  color: Colors.black,
                  title: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.screenRoute);
                  },
                ),
                MyButton(
                  color: Colors.black,
                  title: 'Sign Up',
                  onPressed: () {
                    Navigator.pushNamed(context, SignUpScreen.screenRoute);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
