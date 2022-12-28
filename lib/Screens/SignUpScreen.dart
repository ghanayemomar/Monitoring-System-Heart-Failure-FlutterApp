// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:oma/Screens/HomePageScreen.dart';
import 'package:oma/Utils/color_utils.dart';

import 'package:oma/main.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../Widget/mainWidget.dart';

class SignUpScreen extends StatefulWidget {
  static const String screenRoute = 'SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _FirstNameController = TextEditingController();
  final TextEditingController _LastNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  static Future<User?> SignUpUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } catch (e) {
      print(e);
    }

    return user;
  }

  bool showSpinner = false;
  String _selectedItem = 'Female';
  bool _family = false;
  bool _driver = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
                //MyWidget(),

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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                size: 25,
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        //// First_name  ///////////////////////////////////////////////////////////////////////////////////////////
                        TextFormField(
                          controller: _FirstNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Your First Name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_add_alt,
                              color: Colors.black,
                            ),
                            labelText: 'First Name',
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
                        //// Last_name         /////////////////////////////////////////////////////////////////////////
                        TextFormField(
                          controller: _LastNameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Last Name';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person_add_alt,
                              color: Colors.black,
                            ),
                            labelText: 'Last Name',
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

                        /// Email  ///////////////////////////////////////////////////////////////////////

                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (RegExp(
                                    r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                .hasMatch(value!)) {
                              return null;
                            }
                            return 'Enter a valid email example@gmail.com';
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            labelText: 'Email',
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

                        /// Password  ///////////////////////////////////////////////////////////////////////////////////
                        TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value != null && value.length < 8) {
                              return 'Enter min. 9 character';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            labelText: 'Password',
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

                        /// Phone Number //////////////////////////////////////////////////////////////////////////////

                        TextFormField(
                          controller: _phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter youre Phone Number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.black,
                            ),
                            labelText: 'Phone',
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

                        /// address //////////////////////////////////////////////////////////////////////////////
                        TextFormField(
                          controller: _addressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your Adress';
                            }
                            return null;
                          },
                          //obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.place,
                              color: Colors.black,
                            ),
                            labelText: 'Address',
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

                        /// SEX ///////////////////////////////////////////////////////////////////////////////////////
                        DropdownButton<String>(
                            value: _selectedItem,
                            items: <String>['Female', 'Male']
                                .map((e) =>
                                    DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: ((value) {
                              setState(() {
                                _selectedItem = value.toString();
                              });
                            })),
                        SizedBox(height: 20),

                        /// Login as Driver Or Family //////////////////////////////////////////////////////////////////////
                        Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  'Login as family or Driver',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Row(
                                children: [
                                  Center(
                                    child: Checkbox(
                                      value: _family,
                                      onChanged: ((value) {
                                        setState(() {
                                          _family = value!;
                                        });
                                      }),
                                    ),
                                  ),
                                  Text(
                                    'Family',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Center(
                                    child: Checkbox(
                                      value: _driver,
                                      onChanged: ((value) {
                                        setState(() {
                                          _driver = value!;
                                        });
                                      }),
                                    ),
                                  ),
                                  Text(
                                    'Driver',
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              ),
                            ],
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
                //SizedBox(height: 20),
                Container(
                    width: 360,
                    height: 84,

                    //  height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black)),
                      child: const Text(
                        'Register',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          null;
                        }
                        // setState(() {
                        //   saveContact();
                        // });

                        User? user = await SignUpUsingEmailPassword(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                            context: context);

                        if (user != null) {
                          FirebaseFirestore.instance
                              .collection("Users")
                              .doc(_emailController.text)
                              .set({
                            "first_name": _FirstNameController.text.trim(),
                            "last_name": _LastNameController.text.trim(),
                            "email": _emailController.text.trim(),
                            "phone": _phoneController.text.trim(),
                            "address": _addressController.text.trim(),
                            "Sex": _selectedItem
                          });
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => const MyApp())));
                          //lets make a new screen
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 2),
                              content: Text(
                                'Please Enter a correct information',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          );
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void saveContact() {
  //   String name = _nameController.text;
  //   String number = _numberController.text;
  //   Map<String, String> details = {'name': name, 'number': number};
  //   _databaseReference.push().set(details);
  // }
}
