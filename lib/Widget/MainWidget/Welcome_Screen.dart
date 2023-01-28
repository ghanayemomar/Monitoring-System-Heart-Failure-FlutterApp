// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oma/Screens/EmergencyCall.dart';
import 'package:oma/Screens/HealthMonitoringScreen.dart';
import 'package:oma/Screens/Warning.dart';
import 'package:oma/Widget/MapWidget/Location.dart';
import 'package:oma/Screens/Warning.dart';
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

  String fname = '';
  String lname = '';

  bool isDataLoded = false;
  String UserName = '';
  String driverName = '';
  String finalEmailDriver = '';

  @override
  void initState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emailStorage = prefs.getString('email')!;
    FirebaseFirestore.instance
        .collection('Users')
        .doc(emailStorage)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        Type = snapshot.data()!['Type'].toString();
        if (Type == "Driver") {
          setState(() {
            fname = snapshot.data()!['first_name'].toString();
            lname = snapshot.data()!['last_name'].toString();
            driverName =
                "${fname[0].toUpperCase()}${fname.substring(1)} ${lname[0].toUpperCase()}${lname.substring(1)}";
            UserName = driverName;
            finalEmailDriver = emailStorage;
            isDataLoded = true;
          });
        } else if (Type == "Family") {
          setState(() {
            FirebaseFirestore.instance
                .collection('Users')
                .doc(emailStorage)
                .get()
                .then((snapshot) {
              if (snapshot.exists) {
                fname = snapshot.data()!['first_name'].toString();
                lname = snapshot.data()!['last_name'].toString();
                UserName =
                    "${fname[0].toUpperCase()}${fname.substring(1)} ${lname[0].toUpperCase()}${lname.substring(1)}";
              }
            });

            emailDriver = snapshot.data()!['email_driver'].toString();
            finalEmailDriver = emailDriver;
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
          });

          isDataLoded = true;
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!isDataLoded) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mSecondBackgroundColor, mBackgroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: <Widget>[
                  MyHeader(
                    height: MediaQuery.of(context).size.height * 0.45,
                    imageUrl: 'images/resetPassword.png',
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        HeaderLogo(),
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            fontSize: 35,
                            letterSpacing: 8,
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Text(
                              UserName + '\n\n' + emailStorage,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
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
                                  fontSize: 25,
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
                                press: () {
                                  Navigator.pushNamed(
                                      context, Location.screenRoute);
                                }),
                            MenuCard(
                              imageUrl: 'images/3649810.png',
                              title: 'Emergency ',
                              press: () {
                                Navigator.pushNamed(
                                    context, EmergencyScreen.screenRoute);
                              },
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
                                    context, Warning.screenRoute);
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
                                prefs.setString(
                                    'emailDriver', finalEmailDriver);
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
        });
  }
}
