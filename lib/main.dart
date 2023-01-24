import 'package:flutter/material.dart';
import 'package:oma/Screens/MedicalProfileScreen.dart';
import 'package:oma/Screens/TermsAndServicesScreen.dart';
import 'package:oma/Screens/Warning.dart';
import '../Screens/SignUpScreen.dart';
import '../Screens/LoginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Drawer/navigation_drawer.dart';
import 'Screens/EmergencyCall.dart';
import 'Screens/HomePageScreen.dart';
import 'Screens/PasswordResetScreen.dart';
import 'UserProfile/Profile_Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Warning(),
        routes: {
          LoginScreen.screenRoute: (context) => LoginScreen(),
          SignUpScreen.screenRoute: (context) => SignUpScreen(),
          PasswordResetScreen.screenRoute: (context) => HomePageScreen(),
          HomePageScreen.screenRoute: (context) => HomePageScreen(),
          ProfilePage.screenRoute: (context) => ProfilePage(),
          NavigationDrawer.screenRoute: (context) => NavigationDrawer(),
          MedicalProfileScreen.screenRoute: (context) => MedicalProfileScreen(),
          Warning.screenRoute: (context) => Warning(),
          EmergencyScreen.screenRoute: (context) => EmergencyScreen(),
          TermsAndServices.screenRoute: (context) => TermsAndServices(),
        });
  }
}
