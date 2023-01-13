// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_sms/flutter_sms.dart';
import '../Widget/AnimatedWidget/AnimatedIconBack.dart';
import './constant.dart';
import 'package:telephony/telephony.dart';

_callNumber() async {
  const number = '101'; //set the number here
  bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  String message = 'Hello, this is a test message';
}

_messageNumber() {
  String phoneNumber = '1234567890';
  String message = 'Hello, this is a test message';
  sendSMS(message: message, recipients: [phoneNumber], sendDirect: false)
      .then((value) {
    print('SMS sent');
  });
}

class sendMessage {
  final Telephony telephony = Telephony.instance;

  sendMessage(Future<String> sendSMS);

  void sendSMS(String number, String senderNumber) {
    try {
      telephony.sendSms(
        to: senderNumber,
        message: number,
      );
    } catch (e) {
      //Here Message Failed due to some reason
    }
  }
}

class EmergencyScreen extends StatelessWidget {
  static const String screenRoute = 'EmergencyCallScreen';

  @override
  Widget build(BuildContext context) {
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
                "Make SOS call / SOS Message",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ElevatedButton(
                  child: Icon(
                    Icons.sms,
                    size: 60,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    sendMessage(sendSMS(
                        message: 'message',
                        recipients: ['0569191911,0569101011,01231112310']));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(40),
                      backgroundColor: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
