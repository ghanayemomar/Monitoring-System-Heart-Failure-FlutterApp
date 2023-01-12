// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oma/Screens/HomePageScreen.dart';
import 'package:oma/Screens/Welcome.dart';
import 'package:oma/Utils/Color_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widget/My_Buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String screenRoute = 'LoginScreen';

  @override
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User Found for that email");
      }
    }

    return user;
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showSpinner = false;
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      if (!_focusNode1.hasFocus && !_focusNode2.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _focusNode1.unfocus();
          _focusNode2.unfocus();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: ModalProgressHUD(
              inAsyncCall: showSpinner,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // MyWidget(),
                  SizedBox(height: 30),
                  //// arrow,sign in and iconImage ///////////////////////////////////////////////////////////////

                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: ((context) => WelcomeScreen())));
                            },
                            child: const Icon(
                              size: 28,
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Image.asset(
                              'images/io8.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Take control of your privacy and protect your data online',
                          style: TextStyle(fontSize: 28),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Image.asset(
                          'images/io10.png',
                          width: 150,
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                  ////////////////////////////////////////////////////////////////////////////////////////
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          SizedBox(
                            height: 25,
                          ),

                          SizedBox(height: 20),
                          ////Enter Email//////////////////////////////////////////////////////////////////////
                          TextFormField(
                            focusNode: _focusNode1,
                            controller: _emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Email';
                              }
                              if (!RegExp(
                                      r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                  .hasMatch(value)) {
                                return 'Enter a Valid email "example@gmail.com"';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color: Color.fromARGB(255, 24, 25, 26),
                                  fontSize: 17),
                              labelText: 'Email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              // hintText: 'Enter Your Email',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 22),

                          /// Enter Your Password /////////////////////////////////////////////////////////////
                          TextFormField(
                            focusNode: _focusNode2,
                            controller: _passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Password';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                  color: Color.fromARGB(255, 24, 25, 26),
                                  fontSize: 17),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              labelText: 'Password',
                              // hintText: 'Enter Your Password',
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 20,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueGrey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ////Login Button ///////////////////////////////////////////////////////////

                  const SizedBox(height: 25),
                  MyButton(
                    color: Colors.black,
                    title: 'Login',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        null;
                      }
                      //lets test the app
                      User? user = await loginUsingEmailPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                          context: context);

                      if (user != null) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('email', user.email!);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: ((context) => HomePageScreen())));
                        //lets make a new screen
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                'User not Found',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
