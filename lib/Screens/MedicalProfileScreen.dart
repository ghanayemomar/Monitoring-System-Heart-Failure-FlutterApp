// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oma/UserProfile/appbar_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widget/MainWidget/constant.dart';

import '../Widget/AnimatedWidget/AnimatedIconBack.dart';

class MedicalProfileScreen extends StatefulWidget {
  static const IconData sick = IconData(0xe5a4, fontFamily: 'MaterialIcons');

  static const String screenRoute = 'MedicalProfileScreen';
//  const MedicalProfileScreen({super.key});

  @override
  State<MedicalProfileScreen> createState() => _MedicalProfileScreenState();
}

class _MedicalProfileScreenState extends State<MedicalProfileScreen> {
  String age = ' ';
  String blood = ' ';
  bool attack = false;
  String height = ' ';
  String illnes = ' ';
  String medication = ' ';
  String weight = ' ';
  String fname = ' ';
  String lname = ' ';
  String first_name = ' ';
  String last_name = ' ';
  String _name = ' ';
  String image = ' ';
  String email_driver = ' ';
  String emailStorage = " ";
  String Type = '';

  String _emailDriver = " ";
  bool isDataLoaded = false;
  @override
  void initState() {
    setState(() {
      super.initState();
      getData();
    });
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _emailDriver = prefs.getString('emailDriver')!;
      _name = prefs.getString('driverName')!;
      FirebaseFirestore.instance
          .collection("Medical")
          .doc(_emailDriver)
          .get()
          .then((snapshot) {
        if (snapshot.exists) {
          age = snapshot.data()!['age'].toString();
          blood = snapshot.data()!['blood_type'].toString();
          attack = snapshot.data()!['had_heart_attack'];
          height = snapshot.data()!['height'].toString();
          weight = snapshot.data()!['weight'].toString();
          illnes = snapshot.data()!['illnes'].toString();
          medication = snapshot.data()!['medication_information:'].toString();
          isDataLoaded = true;
        }
      });
    });
    // setState(() {
    //   FirebaseFirestore.instance
    //       .collection("Users")
    //       .doc(_emailDriver)
    //       .get()
    //       .then((snapshotUsers) {
    //     if (snapshotUsers.exists) {
    //       image = snapshotUsers.data()!['image'];
    //       isDataLoaded = true;
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!isDataLoaded)
            // ignore: curly_braces_in_flow_control_structures
            return Scaffold(
                body: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Loading",
                  style: TextStyle(fontSize: 24),
                )
              ],
            )));

          return Scaffold(
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [mBackgroundColor, mSecondBackgroundColor],
                          ),
                        ),
                        // ignore: prefer_const_literals_to_create_immutables
                        child: Column(children: [
                          Container(
                              padding: EdgeInsets.only(top: 50, left: 10),
                              alignment: Alignment.bottomLeft,
                              child: animayedIconBack()),
                          CircleAvatar(
                            radius: 60.0,
                            backgroundImage: AssetImage('images/4138927.png'),
                            //NetworkImage(image),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            'Driver Name: ' + _name,
                            style: TextStyle(
                              color: mTitleTextColor,
                              fontSize: 20.0,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        color: Colors.grey[200],
                        child: Center(
                          child: Card(
                            margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.all(13.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ignore: prefer_const_constructors
                                      Text(
                                        "Driver Information",
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey[300],
                                      ),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.bloodtype,
                                            color: Colors.red,
                                            size: 35,
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Blood Type",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text(
                                                blood,
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey[400],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.heart_broken,
                                            color: Colors.red,
                                            size: 35,
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Had Heart Attack Befor",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text(
                                                attack.toString(),
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey[400],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.sick,
                                            color: Colors.red,
                                            size: 35,
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Chronic Disease",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text(
                                                maxLines: 2,
                                                medication,
                                                overflow: TextOverflow.visible,
                                                // softWrap: false,
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey[400],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 35.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.medication,
                                            color: Colors.red,
                                            size: 35,
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Drug History",
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                ),
                                              ),
                                              Text(
                                                illnes,
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.grey[400],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 20.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.33,
                    left: 20.0,
                    right: 20.0,
                    child: Card(
                        child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              child: Column(
                            children: [
                              Text(
                                'Age',
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 14.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                age,
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              )
                            ],
                          )),
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  'Weight',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 14.0),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  weight,
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              child: Column(
                            children: [
                              Text(
                                'Height',
                                style: TextStyle(
                                    color: Colors.grey[400], fontSize: 14.0),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                height,
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              )
                            ],
                          )),
                        ],
                      ),
                    )))
              ],
            ),
          );
        },
      ),
    );
  }
}
