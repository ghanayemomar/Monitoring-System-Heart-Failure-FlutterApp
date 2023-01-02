import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:oma/Screens/LoginScreen.dart';
import 'package:oma/Screens/welcome.dart';
import 'package:oma/Widget/My_Buttom.dart';

class Token extends StatefulWidget {
  String familyEmail;
  Token({required this.familyEmail});

  @override
  State<Token> createState() => _TokenState();
}

class _TokenState extends State<Token> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _TokenDriverController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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

  Future<String> getToken(String email) async {
    // Retrieve the user associated with the email
    final DocumentSnapshot document =
        await FirebaseFirestore.instance.collection('Users').doc(email).get();
    return document['token_driver'].toString();
  }

  Future<bool> isDocumentExsist(String doName) async {
    // Retrieve the user associated with the email
    final DocumentSnapshot document =
        await FirebaseFirestore.instance.collection('Users').doc(doName).get();
    if (document.exists) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> updateEmailTokenDriver(String email, String token) async {
    final DocumentReference emailRef =
        FirebaseFirestore.instance.collection('Users').doc(widget.familyEmail);
    await emailRef.update({'token_driver': token, 'email_driver': email});
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        _focusNode1.unfocus();
        _focusNode2.unfocus();
      }),
      child: Form(
        key: _formKey,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Enter the email and the token number for Driver to accsess there information and state of health :  ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ////driver email ////////////////////////////////////////////////////////////////////////
                  TextFormField(
                    controller: _emailController,
                    focusNode: _focusNode1,
                    //  controller: _emailController,
                    validator: (value) {
                      if (RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                          .hasMatch(value!)) {
                        return null;
                      }
                      return 'Enter a valid email example@gmail.com';
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                          // color: Color.fromARGB(255, 24, 25, 26), fontSize: 17
                          ),
                      prefixIcon: Icon(
                        Icons.email,
                        //   color: Colors.white,
                      ),
                      labelText: 'Email',
                      // labelStyle: TextStyle(color: Colors.white),
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
                          //  color: Colors.white,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          // color: Colors.blueGrey,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  //// Token number ////////////////////////////////////////////////////////////////////////////
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a token number';
                      }
                      return null;
                    },
                    controller: _TokenDriverController,
                    focusNode: _focusNode2,
                    style: TextStyle(
                        //    color: Colors.white,
                        fontSize: 18),
                    decoration: const InputDecoration(
                      suffixIcon: Tooltip(
                        textStyle: TextStyle(
                            //    color: Colors.black,
                            //fontWeight: FontWeight.bold,
                            fontSize: 18),
                        message:
                            'Token number:\nTo accsses the\ndriver information',
                        child: Icon(
                          Icons.info,
                          // color: Colors.redAccent,
                          size: 30,
                        ),
                        waitDuration: Duration(seconds: 7),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelStyle: TextStyle(
                          //   color: Colors.white,
                          fontSize: 18),
                      labelText: 'Token',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    // width: double.infinity,
                  ),
                  Container(
                    width: 360,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          null;
                        }

                        final String email = _emailController.text;
                        final String token = _TokenDriverController.text;
                        if (await isDocumentExsist(email) &&
                            await getToken(email) == token) {
                          print('correct');
                          updateEmailTokenDriver(email, token);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: ((context) => LoginScreen())));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 4),
                              content: Text(
                                'Inalid Email or Token Number',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          );
                        }
                        // print('herrrrrrrrrrrrrrrrrrrrrr');
                        // print(await getToken(email));
                        // print(_TokenDriverController.text);
                        // if (await getToken(email)) {
                        //  // updateEmailVerificationStatus(email, true);
                        // } else {
                        //   print('Eroorororoorororroroor');
                        // }
                      },
                      child: Text(
                        'Done',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                      ),
                    ),
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
