// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../Widget/My_Buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Widget/mainWidget.dart';

class SignInScreen extends StatefulWidget {
  static const String screenRoute = 'sign';

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance; //define var for firebase
  late String email;
  late String password;
  bool showSpinner = false;
  bool _btnActive1 = false;
  bool _btnActive2 = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyWidget(),
              SizedBox(height: 70),
              ////////////
              /////
              ////
              ////
              ////
              ////
              ////
              ////
              ////
              ////
              ////
              ////
              ////
              ///
              ///
              ///
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                          _btnActive1 = value.length >= 1 ? true : false;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Your Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
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
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                          _btnActive2 = value.length >= 1 ? true : false;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          labelText: 'Enter Your Password',
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
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
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
              //////////////////
              //////////////////
              ////////////
              ////////
              ////
              ////
              ////
              ////
              ////
              ////
              ///
              const SizedBox(height: 30),
              MyButton(
                color: Colors.black,
                title: 'Login',
                onPressed: () async {
                  setState(() {
                    if (!_formKey.currentState!.validate()) {}
                    _btnActive1 && _btnActive2 == true
                        ? showSpinner = true
                        : () {};
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.pushNamed(context, 'log');
                      setState(() {
                        showSpinner = false;
                      });
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == "user-not-found") {
                      print("No User Found for that email");
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
// _btnActive1 = value.length >= 1 ? true : false;