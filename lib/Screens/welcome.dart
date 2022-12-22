import 'package:flutter/material.dart';

import 'regestrition.dart';
import 'signin.dart';

import '../my_buttom.dart';

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
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: Colors.black,
                    gradient: LinearGradient(
                      //mix color's
                      colors: [(Colors.white), Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Image.asset(
                          "images/lo1.png",
                          height: 180,
                          width: 180,
                        ),
                      ),
                      const Text(
                        "Safe Health Care",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 26.0,
                            fontFamily: 'IndieFlower'),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(right: 20, top: 20),
                      //   alignment: Alignment.bottomRight,
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.pop(context);
                      //       // Write Click Listener Code Here.

                      //       // Write Click Listener Code Here
                      //     },
                      //     child: Icon(
                      //       Icons.arrow_back,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // )
                    ],
                  )),
                ),

                // Container(
                //   height: 250,
                //   child: Image.asset('images/lo1.png'),
                // ),
                const SizedBox(height: 50),

                const Text(
                  'Please Login Or Sign Up ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
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
              title: 'SignUp',
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
