import 'package:flutter/material.dart';
import 'package:oma/Screens/HomePageScreen.dart';
import 'package:oma/profile/prrofile_screen.dart';
import 'package:oma/Screens/SignUp.dart';
import 'package:oma/Screens/Login.dart';
import 'package:oma/Screens/Splash_Screen.dart';
import 'package:oma/Screens/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'drawer/navigation_drawer.dart';

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
        "sign": (context) => SignInScreen(),
        "reg": (context) => RegistrationScreen(),
        "SignInScreen": (context) => SignInScreen(),
        "d": (context) => NavigationDrawer(),
        "log": (context) => HomePageScreen(),
        "profile": (context) => ProfileScreen(),
        "out": (context) => SignInScreen(),
        "prof": (context) => ProfileScreen(),
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        SignInScreen.screenRoute: (context) => SignInScreen(),
        RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
      },
      home: SplashScreen(),
    );
  }
}
