import 'package:flutter/material.dart';
import 'package:oma/Screens/HomePageScreen.dart';
import 'package:oma/Screens/OrderTackingScreen.dart';
import 'package:oma/Screens/Splash_Screen.dart';
import 'package:oma/profile/prrofile_screen.dart';
import 'package:oma/Screens/SignUpScreen.dart';
import 'package:oma/Screens/LoginScreen.dart';
import 'package:oma/Screens/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'drawer/navigation_drawer.dart';
import './Screens/OrderTackingScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        LoginScreen.screenRoute: (context) => LoginScreen(),
        SignUpScreen.screenRoute: (context) => SignUpScreen(),
        HomePageScreen.screenRoute: (context) => HomePageScreen(),
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        // SimpleMapScreen.screenRoute: (context) => SimpleMapScreen(),
        "d": (context) => NavigationDrawer(),
        "profile": (context) => ProfileScreen(),
        "out": (context) => LoginScreen(),
        "prof": (context) => ProfileScreen(),
      },
      home: OrderTrackingPage(),
    );
  }
}
//muhammed