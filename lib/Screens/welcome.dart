import 'package:flutter/material.dart';
import './SignUpScreen.dart';
import './LoginScreen.dart';
import '../Widget/My_Buttom.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'Welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // final FocusNode _focusNode1 = FocusNode();
  // @override
  // void initState() {
  //   super.initState();
  //   _focusNode1.addListener(() {
  //     if (!_focusNode1.hasFocus) {
  //       FocusScope.of(context).unfocus();
  //     }
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(fit: StackFit.expand, children: [
        Container(
          //padding: const EdgeInsets.only(top: 200),
          //width: double.infinity,
          //height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/login.png'), fit: BoxFit.cover),
          ),
        ),
        const SizedBox(
            child: Padding(
          padding: EdgeInsets.all(43.0),
          child: Text(
            "Safe Drive",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 50,
                letterSpacing: 20),
          ),
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(
              'Please Login Or Sign Up ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                // fontFamily: 'IndieFlower',
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
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
      ]),
    );
  }
}
