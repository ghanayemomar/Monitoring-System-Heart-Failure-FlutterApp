// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widget/AnimatedWidget/AnimatedIconBack.dart';
import './constant.dart';

class sendMessage {
  // final telephony = Telephony.instance;

  sendMessage(Future<String> sendSMS);

  void sendSMS(String number, String senderNumber) {
    // try {
    //   telephony.sendSms(
    //     to: senderNumber,
    //     message: number,
    //   );
    // } catch (e) {
    //   //Here Message Failed due to some reason
    // }
  }
}

class EmergencyScreen extends StatefulWidget {
  static const String screenRoute = 'EmergencyCallScreen';

  @override
  State<EmergencyScreen> createState() => _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  String BirhDate = ' ';
  String Age = '';
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
  String temp = '';

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
    _emailDriver = prefs.getString('emailDriver')!;
    _name = prefs.getString('driverName')!;
    setState(() {
      FirebaseFirestore.instance
          .collection("Medical")
          .doc(_emailDriver)
          .get()
          .then((snapshot) {
        if (snapshot.exists) {
          BirhDate = snapshot.data()!['birthdate'].toString();
          blood = snapshot.data()!['blood_type'].toString();
          attack = snapshot.data()!['had_heart_attack'];
          height = snapshot.data()!['height'].toString();
          weight = snapshot.data()!['weight'].toString();
          illnes = snapshot.data()!['illnes'].toString();
          medication = snapshot.data()!['medication_information:'].toString();
          DateTime birthdateTime = DateTime.parse(BirhDate);
          Duration age = DateTime.now().difference(birthdateTime);
          Age = (age.inDays / 365.25).toStringAsFixed(1);

          temp =
              '*URGENT: I am experiencing unnatural changes in my heart beats and I fear I may have had a heart attack or may have one soon. I have attached my medical history and my current location to this message. Please send medical assistance immediately.*                                                                   ' +
                  'Name: ' +
                  _name +
                  '          ' +
                  'Birthdate: ' +
                  BirhDate +
                  '                ' +
                  'Blood Type: ' +
                  blood +
                  ' , ' +
                  'Had Heart Attack Before: ' +
                  attack.toString() +
                  '  , ' +
                  'Height: ' +
                  height +
                  '  , ' +
                  'Weight: ' +
                  weight +
                  '  , ' +
                  'Drug History: ' +
                  medication +
                  '  , ' +
                  'Chronic Disease: ' +
                  illnes +
                  '  , ' +
                  'Location Link: ' +
                  ' https://goo.gl/maps/qYVhPou24t5uHQrY8 ';
        }
        isDataLoaded = true;
      });
    });
  }

  _callNumber() async {
    const number = '101'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    String message = 'Hello, this is a test message';
  }

  _messageNumber() {
    String phoneNumber1 = '101';
    String message = temp;
    sendSMS(message: message, recipients: [phoneNumber1], sendDirect: false)
        .then((value) {
      print('SMS sent');
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!isDataLoaded)
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
            appBar: AppBar(
              leading: animayedIconBack(),
              backgroundColor: mSecondBackgroundColor,
              elevation: 0,
              title: const Text(
                "Emergency Call",
                style: TextStyle(color: mPrimaryTextColor, fontSize: 30),
              ),
              centerTitle: true,
            ),
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [mSecondBackgroundColor, mBackgroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0, bottom: 30),
                    child: Text(
                      "Make SOS call",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: _callNumber,
                          child: Icon(
                            Icons.phone,
                            color: Colors.red,
                            size: 60,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(40),
                              backgroundColor: Colors.white)),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Make SOS Message",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    child: Icon(
                      Icons.sms,
                      size: 60,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _messageNumber();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(40),
                        backgroundColor: Colors.white),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
