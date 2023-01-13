// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../Widget/AnimatedWidget/AnimatedIconBack.dart';
import './constant.dart';

class TermsAndServices extends StatelessWidget {
  static const String screenRoute = 'TermsAndServices';

  const TermsAndServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: animayedIconBack(),
          backgroundColor: mSecondBackgroundColor,
          elevation: 0,
          title: const Text(
            "Terms And Servicrs",
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
            child: SingleChildScrollView(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: const Text(
                      "Welcome to our mobile application, which connects families with drivers and allows them to share location and health information. By using our app, you agree to be bound by the following terms and conditions:",
                      style: TextStyle(
                        color: mPrimaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        getText(
                          "1. Account Creation and Registration. To use our app, you must first create an account by providing accurate and complete information. If you register as a driver, you must also provide information about your medical history. By creating an account, you agree to update your information as necessary to keep it accurate and complete.",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        getText(
                            "2. Use of Location Services. Our app allows you to share your location with family members. By using this feature, you agree to allow us to collect and use your location data to provide this service."),
                        SizedBox(
                          height: 10,
                        ),
                        getText(
                            "3. Health Monitoring. Our app allows you to share health information with family members. By using this feature, you agree to allow us to collect and use your health data to provide this service."),
                        SizedBox(
                          height: 10,
                        ),
                        getText(
                            "4. Emergency Call. Our app allows you to make emergency calls or send an SOS message in case of an emergency. By using this feature, you agree to use it only in the event of an emergency and to follow all relevant laws and regulations."),
                        SizedBox(
                          height: 10,
                        ),
                        getText(
                            "5. Profile and Medical History. Our app allows you to view your own profile and medical history. By using this feature, you agree to keep your information up-to-date and accurate."),
                        SizedBox(
                          height: 10,
                        ),
                        getText(
                            "6. Privacy. We respect your privacy and are committed to protecting your personal information. Our Privacy Policy, which is incorporated by reference into these Terms of Service, explains how we collect, use, and disclose your information."),
                        SizedBox(
                          height: 10,
                        ),
                        getText(
                            "7. Limitation of Liability. To the fullest extent permitted by law, we will not be liable for any damages of any kind arising from the use of our app, including, but not limited to, direct, indirect, incidental, punitive, and consequential damages."),
                        SizedBox(
                          height: 10,
                        ),
                        getText(
                            "8. Changes to These Terms of Service. We reserve the right to change these terms and conditions at any time. Your continued use of our app following any changes indicates your acceptance of the new terms."),
                        SizedBox(
                          height: 10,
                        ),
                        getText(
                            "9. Governing Law. These terms and conditions shall be governed by and construed in accordance with the laws of the country in which the app is based without giving effect to any principles of conflicts of law.")
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Text getText(String text) {
    return Text(
      text,
      style: TextStyle(color: mPrimaryTextColor, fontSize: 15),
    );
  }
}
