import 'package:flutter/material.dart';
import '../Screens/HomePageScreen.dart';
import '../Screens/SignUpScreen.dart';
import '../Screens/LoginScreen.dart';
import '../Screens/Welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Drawer/navigation_drawer.dart';
import 'UserProfile/Profile_Page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: NavigationDrawer(),
      routes: {
        LoginScreen.screenRoute: (context) => LoginScreen(),
        SignUpScreen.screenRoute: (context) => SignUpScreen(),
        HomePageScreen.screenRoute: (context) => HomePageScreen(),
        WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
        ProfilePage.screenRoute: (context) => ProfilePage(),
        NavigationDrawer.screenRoute: (context) => NavigationDrawer(),
      },
    );
  }
}
//muhammed
//ghanayem
