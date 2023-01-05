// ignore_for_file: prefer_const_constructors
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widget/MainWidget/constant.dart';

import '../Widget/AnimatedWidget/AnimatedIconBack.dart';

class MedicalProfileScreen extends StatefulWidget {
  static const IconData sick = IconData(0xe5a4, fontFamily: 'MaterialIcons');

  static const String screenRoute = 'MedicalProfileScreen';
  const MedicalProfileScreen({super.key});

  @override
  State<MedicalProfileScreen> createState() => _MedicalProfileScreenState();
}

class _MedicalProfileScreenState extends State<MedicalProfileScreen> {
  String age = '';
  String blood = '';
  bool attack = false;
  String height = '';
  String illnes = '';
  String medication = '';
  String weight = '';
  String fname = '';
  String lname = '';
  String first_name = '';
  String last_name = '';
  String name = '';
  String image = '';
  String email_driver = '';
  String emailStorage = "";
  //String Type = '';

  String emailDriver = 'A';

  @override
  Future<String> getEmailDriver() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString("email");
    //String emailDriver='';

    if (email != null) {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection("Users").doc(email).get();
      if (snapshot.exists) {
        if (snapshot.get("Type") == "Family") {
          emailDriver = snapshot.get("email_driver");
          // fname = snapshot.get('first_name');
          //  lname = snapshot.get('last_name');
        } else if (snapshot.get("Type") == "Driver") {
          emailDriver = email;
        }
      }
    }

    return emailDriver;
  }

  @override
  void initState() {
    super.initState();
    getEmailDriver().then((value) {
      setState(() {
        emailDriver = value;
      });
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Medical")
              .doc(emailDriver)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData)
              return Scaffold(body: Center(child: CircularProgressIndicator()));

            age = snapshot.data!['age'];
            blood = snapshot.data!['blood_type'];
            attack = snapshot.data!['had_heart_attack'];
            height = snapshot.data!['height'];
            illnes = snapshot.data!['illnes'];
            medication = snapshot.data!['medication_information:'];
            weight = snapshot.data!['weight'];

            //  first_name = fname[0].toUpperCase() + fname.substring(1);
            // last_name = lname[0].toUpperCase() + lname.substring(1);
            name = 'first_name + ' ' + last_name';
            image = '';

            emailStorage = "";
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
                              colors: [
                                mBackgroundColor,
                                mSecondBackgroundColor
                              ],
                            ),
                          ),
                          // ignore: prefer_const_literals_to_create_immutables
                          child: Column(children: [
                            Container(
                                padding: EdgeInsets.only(top: 50, left: 10),
                                alignment: Alignment.bottomLeft,
                                child: animayedIconBack()),
                            const CircleAvatar(
                              radius: 65.0,
                              backgroundImage: AssetImage('images/4138927.png'),
                              // backgroundColor: Colors.white,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              'Driver Name: ' + name,
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
                                                  overflow:
                                                      TextOverflow.visible,
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
                                        color: Colors.grey[400],
                                        fontSize: 14.0),
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
      ),
    );
  }
}
