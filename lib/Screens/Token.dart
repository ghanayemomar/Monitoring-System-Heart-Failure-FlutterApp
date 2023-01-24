// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oma/Screens/LoginScreen.dart';

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
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 100),
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/resetPassword.png'),
                    fit: BoxFit.cover),
              )),
          SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: const Text(
                  'Please Enter the email and the token number for Driver to accsess there information and state of health',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1),
                )),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 340,
                    ),

                    ////driver email ////////////////////////////////////////////////////////////////////////
                    TextFormField(
                      controller: _emailController,
                      focusNode: _focusNode1,
                      validator: (value) {
                        if (RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                            .hasMatch(value!)) {
                          return null;
                        }
                        return 'Enter a valid email example@gmail.com';
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        errorStyle: TextStyle(color: Colors.red, fontSize: 17),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 18),
                        labelText: 'Email',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
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
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: const InputDecoration(
                        suffixIcon: Tooltip(
                          textStyle: TextStyle(
                              // color: Colors.red,
                              //fontWeight: FontWeight.bold,
                              fontSize: 18),
                          message:
                              'Token number:\nTo accsses the\ndriver information',
                          child: Icon(
                            Icons.info,
                            color: Colors.white,
                            size: 30,
                          ),
                          waitDuration: Duration(seconds: 7),
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
                            color: Colors.white,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 18),
                        labelText: 'Token',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        prefixIcon: Icon(
                          Icons.generating_tokens,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      // width: double.infinity,
                    ),
                    Container(
                      width: 330,
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
        ]),
      ),
    );
  }
}
