// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../Screens/MedicalProfileScreen.dart';
import '../AnimatedWidget/AnimatedIconDrawer.dart';
import 'Header_Logo.dart';
import 'Menu_Card.dart';
import 'My_Header.dart';
import './constant.dart';

class WelcomeScreenTesting extends StatefulWidget {
  @override
  State<WelcomeScreenTesting> createState() => _WelcomeScreenTestingState();
}

class _WelcomeScreenTestingState extends State<WelcomeScreenTesting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyHeader(
          height: 333,
          imageUrl: 'images/test.jpg',
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              HeaderLogo(),
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
                  color: mTitleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Hello Omar Ghanayem\nEnjoy Your Drive',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 36,
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [mBackgroundColor, mSecondBackgroundColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Our Health\nServices',
                        style: TextStyle(
                          color: mTitleTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      animayedIconDrawer(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MenuCard(
                        imageUrl: 'images/7492103.png',
                        title: 'Location Services',
                        press: () {}),
                    MenuCard(
                      imageUrl: 'images/3649810.png',
                      title: 'Emergency ',
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MenuCard(
                      imageUrl: 'images/3195462.png',
                      title: 'Health Monitoring',
                      press: () {},
                    ),
                    MenuCard(
                      imageUrl: 'images/4138927.png',
                      title: 'Medical History',
                      press: () {
                        Navigator.pushNamed(
                            context, MedicalProfileScreen.screenRoute);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
