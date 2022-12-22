import 'package:flutter/material.dart';
import 'package:oma/HomeP.dart';
import 'package:oma/profile/prrofile_screen.dart';
import 'package:oma/Screens/regestrition.dart';
import 'package:oma/Screens/signin.dart';
import 'package:oma/Screens/splash_screen.dart';
import 'package:oma/Screens/welcome.dart';
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        "sign": (context) => SignInScreen(),
        "reg": (context) => RegistrationScreen(),
        "SignInScreen": (context) => SignInScreen(),
        "d": (context) => NavigationDrawer(),
        "log": (context) => HomeP(),
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
