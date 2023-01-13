// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oma/Screens/LoginScreen.dart';
import 'package:oma/Screens/MedicalHistoryScreen.dart';
import 'package:oma/Screens/Token.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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

  final TextEditingController _TokenDriverController = TextEditingController();

  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();
  final FocusNode _focusNode6 = FocusNode();
  final FocusNode _focusNode7 = FocusNode();
  final FocusNode _focusNode8 = FocusNode();
  final FocusNode _focusNode9 = FocusNode();

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
  String _Gender = 'Select...';
  String _image =
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80';

  String _Type = '';
  bool _family = false;
  bool _driver = false;
  bool _emailKey = false;
  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      if (!_focusNode1.hasFocus &&
          !_focusNode2.hasFocus &&
          !_focusNode3.hasFocus &&
          !_focusNode4.hasFocus &&
          !_focusNode5.hasFocus &&
          !_focusNode6.hasFocus &&
          !_focusNode7.hasFocus &&
          !_focusNode8.hasFocus &&
          !_focusNode9.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: Stack(fit: StackFit.expand, children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SvgPicture.asset(
            "images/signup.svg",
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: (() {
            _focusNode1.unfocus();
            _focusNode2.unfocus();
            _focusNode3.unfocus();
            _focusNode4.unfocus();
            _focusNode5.unfocus();
            _focusNode6.unfocus();
            _focusNode7.unfocus();
            _focusNode8.unfocus();
            _focusNode9.unfocus();
          }),
          child: SafeArea(
            child: SingleChildScrollView(
              child: ModalProgressHUD(
                inAsyncCall: showSpinner,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Text(
                          "Create New Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account? ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            TextButton(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.blue,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, LoginScreen.screenRoute);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            TextFormField(
                              focusNode: _focusNode1,
                              controller: _FirstNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Your First Name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                errorStyle:
                                    TextStyle(color: Colors.red, fontSize: 17),
                                prefixIcon: Icon(
                                  Icons.person_add_alt,
                                  color: Colors.black,
                                ),
                                labelText: 'First Name',
                                labelStyle: TextStyle(color: Colors.black),
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
                                    color: Colors.black,
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
                              focusNode: _focusNode2,
                              controller: _LastNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter Your Last Name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                errorStyle:
                                    TextStyle(color: Colors.red, fontSize: 17),
                                prefixIcon: Icon(
                                  Icons.person_add_alt,
                                  color: Colors.black,
                                ),
                                labelText: 'Last Name',
                                labelStyle: TextStyle(color: Colors.black),
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
                                    color: Colors.black,
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
                              focusNode: _focusNode3,
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
                                errorStyle:
                                    TextStyle(color: Colors.red, fontSize: 17),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.black),
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
                                    color: Colors.black,
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
                              focusNode: _focusNode4,
                              controller: _passwordController,
                              validator: (value) {
                                if (value != null && value.length < 8) {
                                  return 'Enter Password Min. 9 character';
                                }
                                return null;
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                errorStyle:
                                    TextStyle(color: Colors.red, fontSize: 17),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.black),
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
                                    color: Colors.black,
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
                              focusNode: _focusNode5,
                              controller: _phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter youre Phone Number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                errorStyle:
                                    TextStyle(color: Colors.red, fontSize: 17),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                                labelText: 'Phone',
                                labelStyle: TextStyle(color: Colors.black),
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
                              focusNode: _focusNode6,
                              controller: _addressController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your Adress';
                                }
                                return null;
                              },
                              //obscureText: true,
                              decoration: InputDecoration(
                                errorStyle:
                                    TextStyle(color: Colors.red, fontSize: 17),
                                prefixIcon: Icon(
                                  Icons.place,
                                  color: Colors.black,
                                ),
                                labelText: 'Address',
                                labelStyle: TextStyle(color: Colors.black),
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
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),

                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Text(
                                        'Login as Family or Driver:',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Checkbox(
                                        value: _family,
                                        onChanged: ((value) {
                                          setState(() {
                                            _focusNode1.unfocus();
                                            _focusNode2.unfocus();
                                            _focusNode3.unfocus();
                                            _focusNode4.unfocus();
                                            _focusNode5.unfocus();
                                            _focusNode6.unfocus();
                                            _focusNode7.unfocus();
                                            _focusNode8.unfocus();
                                            _focusNode9.unfocus();
                                            _family = value!;
                                            _driver = false;
                                            _emailKey = true;
                                          });
                                        }),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Family',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Center(
                                        child: Checkbox(
                                          value: _driver,
                                          onChanged: ((value) {
                                            setState(() {
                                              _focusNode1.unfocus();
                                              _focusNode2.unfocus();
                                              _focusNode3.unfocus();
                                              _focusNode4.unfocus();
                                              _focusNode5.unfocus();
                                              _focusNode6.unfocus();
                                              _focusNode7.unfocus();
                                              _focusNode8.unfocus();
                                              _focusNode9.unfocus();
                                              _driver = value!;
                                              _family = false;
                                              _emailKey = false;
                                            });
                                          }),
                                        ),
                                      ),
                                      Text(
                                        'Driver',
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 250,
                                        height: 40,
                                        child: Visibility(
                                          visible: _driver,
                                          child: TextFormField(
                                            controller: _TokenDriverController,
                                            focusNode: _focusNode9,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize: 18),
                                            decoration: const InputDecoration(
                                              suffixIcon: Tooltip(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    //fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                                message:
                                                    'Token number:\nAllow family accsses\ndriver information',
                                                child: Icon(
                                                  Icons.info,
                                                  color: Colors.redAccent,
                                                  size: 30,
                                                ),
                                                showDuration:
                                                    Duration(seconds: 8),
                                              ),
                                              border: OutlineInputBorder(),
                                              labelStyle: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 18),
                                              labelText: 'Token',
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            /// Gender ///////////////////////////////////////////////////////////////////////////////////////
                            Container(
                              alignment: Alignment(-0.7, 0.0),
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Gender :',
                                    //textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  DropdownButtonFormField<String>(
                                    value: _Gender,
                                    validator: ((value) {
                                      if (value == null) {
                                        return 'Please Select an option';
                                      }
                                      return null;
                                    }),
                                    onChanged: ((value) {
                                      setState(() {
                                        _Gender = value.toString();
                                      });
                                    }),
                                    alignment: Alignment.centerLeft,
                                    dropdownColor: Colors.blue,
                                    elevation: 20,
                                    icon: Icon(
                                      Icons.arrow_downward,
                                      color: Colors.blue,
                                    ),
                                    items: <String>[
                                      'Select...',
                                      'Male',
                                      'Female',
                                    ]
                                        .map(
                                          (e) => DropdownMenuItem(
                                              value: e,
                                              child: Row(
                                                // mainAxisAlignment:
                                                //   MainAxisAlignment.spaceAround,
                                                children: [
                                                  Text(
                                                    e,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20),
                                                  ),
                                                  // SizedBox(
                                                  //   width: 90,
                                                  // ),
                                                  // Icon(
                                                  //   Icons.female,
                                                  //   color: Colors.blue,
                                                  // )
                                                ],
                                              )),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
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
                          } // setState(() {
                          //   saveContact();
                          // });

                          User? user = await SignUpUsingEmailPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim(),
                              context: context);

                          if (_family == true) {
                            _Type = "Family";
                          } else if (_driver == true) {
                            _Type = "Driver";
                          }

                          if (user != null) {
                            FirebaseFirestore.instance
                                .collection("Users")
                                .doc(_emailController.text)
                                .set({
                              "first_name": _FirstNameController.text.trim(),
                              "last_name": _LastNameController.text.trim(),
                              "email":
                                  _emailController.text.trim().toLowerCase(),
                              "phone": _phoneController.text.trim(),
                              "address": _addressController.text.trim(),
                              "Type": _Type,
                              "Gender": _Gender,
                              "token_driver":
                                  _TokenDriverController.text.trim(),
                              "image": _image,
                            }).then((vlaue) => {
                                      //print(_emailController.text.trim())
                                    });
                            if (_Type == "Driver") {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: ((context) => MedicalHistoryPage(
                                            email: _emailController.text.trim(),
                                          ))));
                            } else if (_Type == "Family") {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: ((context) => Token(
                                          familyEmail:
                                              _emailController.text))));
                            }

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
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
