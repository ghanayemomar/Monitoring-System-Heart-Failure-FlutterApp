// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oma/Screens/HealthMonitoringScreen.dart';
import 'package:oma/Widget/Spiner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Screens/MedicalProfileScreen.dart';
import '../AnimatedWidget/AnimatedIconDrawer.dart';
import 'Header_Logo.dart';
import 'Menu_Card.dart';
import 'My_Header.dart';
import './constant.dart';

class WelcomeScreenWidget extends StatefulWidget {
  @override
  State<WelcomeScreenWidget> createState() => _WelcomeScreenWidgetState();
}

class _WelcomeScreenWidgetState extends State<WelcomeScreenWidget> {
  String emailStorage = " ";
  String Type = '';
  String emailDriver = " ";
  String driverName = '';
  String fname = '';
  String lname = '';
  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailDriver = prefs.getString('email')!;
      print(emailStorage);
      FirebaseFirestore.instance
          .collection('Users')
          .doc(emailDriver)
          .get()
          .then((snapshot) {
        if (snapshot.exists) {
          Type = snapshot.data()!['Type'].toString();
          if (Type == "Driver") {
            fname = snapshot.data()!['first_name'].toString();
            lname = snapshot.data()!['last_name'].toString();
            driverName =
                "${fname[0].toUpperCase()}${fname.substring(1)} ${lname[0].toUpperCase()}${lname.substring(1)}";
          } else if (Type == "Family") {
            emailDriver = snapshot.data()!['email_driver'].toString();
            FirebaseFirestore.instance
                .collection('Users')
                .doc(emailDriver)
                .get()
                .then((snapshot) {
              if (snapshot.exists) {
                fname = snapshot.data()!['first_name'].toString();
                lname = snapshot.data()!['last_name'].toString();
                driverName =
                    "${fname[0].toUpperCase()}${fname.substring(1)} ${lname[0].toUpperCase()}${lname.substring(1)}";
              } else {
                print('Document does not exist on the database');
              }
            });
          }
        } else {
          print('Document does not exist on the database');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          MyHeader(
            height: 333,
            imageUrl: 'images/1dce8fbb1b3377378628f68d1e7c4c23.jpg',
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
                    color: mPrimaryTextColor,
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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
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
                      press: () {
                        Navigator.pushNamed(
                            context, HealthMonirtoring.screenRoute);
                      },
                    ),
                    MenuCard(
                      imageUrl: 'images/4138927.png',
                      title: 'Medical History',
                      press: () async {
                        print(emailDriver);
                        print(driverName);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('emailDriver', emailDriver);
                        prefs.setString('driverName', driverName);
                        Navigator.pushNamed(
                            context, MedicalProfileScreen.screenRoute);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
