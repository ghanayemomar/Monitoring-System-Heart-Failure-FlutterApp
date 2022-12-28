import 'package:flutter/material.dart';
import 'package:oma/Screens/OrderTackingScreen.dart';
import '../Screens/splash_screen.dart';
import '../Screens/HomePageScreen.dart';
import '../profile/prrofile_screen.dart';
import '../Screens/SignUpScreen.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'drawer/navigation_drawer.dart';
import '../Screens/OnBoardScreen.dart';

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
        home: OnBoardScreen());
  }
}
//muhammed
//ghanayem
