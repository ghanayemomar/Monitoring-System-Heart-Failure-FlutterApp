// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../Widget/My_Buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Widget/mainWidget.dart';

class RegistrationScreen extends StatefulWidget {
  static const String screenRoute = 'reg';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;
  late String phone;
  bool showSpinner = false;
  bool _btnActive1 = false;
  bool _btnActive2 = false;
  bool _btnActive3 = false;
  bool _btnActive4 = false;
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
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyWidget(),
              SizedBox(height: 50),
              //////
              /////
              ////
              /////
              ////
              ////
              /////
              ///
              /////
              ////
              ////
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          name = value;
                          _btnActive1 = value.length >= 1 ? true : false;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          labelText: 'Enter Your Name',
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
                      SizedBox(height: 20),
                      ///////
                      /////
                      ///
                      /////
                      ////
                      ////
                      ////
                      ////
                      TextFormField(
                        validator: (value) {
                          if (RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                              .hasMatch(value!)) {
                            return null;
                          }
                          return 'Please Enter Your Email';
                        },
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          email = value;
                          _btnActive2 =
                              (RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                      .hasMatch(value!))
                                  ? true
                                  : false;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          labelText: 'Enter Your Email',
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
                      SizedBox(height: 20),
                      /////
                      ////
                      ////
                      ////
                      ////
                      ////
                      ///
                      //////
                      ///
                      /////
                      ////
                      TextFormField(
                        validator: (value) {
                          if (value.toString().length < 10) {
                            return 'Please Enter Your Phone';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {
                          phone = value;
                          _btnActive3 = value.length >= 10 ? true : false;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          labelText: 'Enter Your Phone',
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
                      SizedBox(height: 20),
                      TextFormField(
                        validator: (value) {
                          if (value.toString().length <= 9) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                        obscureText: true,
                        onChanged: (value) {
                          password = value;
                          _btnActive4 = value.length >= 9 ? true : false;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          labelText: 'Enter Your Password',
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
              /////
              ////
              ////
              ////
              ////
              ////
              ////
              ////
              ////
              ///
              ////
              ////
              ////
              ///
              SizedBox(height: 30),
              MyButton(
                color: Colors.black,
                title: 'Register',
                onPressed: () async {
                  setState(() {
                    if (!_formKey.currentState!.validate()) {}
                    _btnActive1 &&
                            _btnActive2 &&
                            _btnActive3 &&
                            _btnActive4 == true
                        ? showSpinner = true
                        : showSpinner = false;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, 'SignInScreen');
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
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
