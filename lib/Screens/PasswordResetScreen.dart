import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:oma/Screens/LoginScreen.dart';
import 'package:oma/Widget/AnimatedWidget/AnimatedIconBack.dart';
import 'package:oma/Widget/My_Buttom.dart';
import '../Widget/AnimatedWidget/AnimatedIconWelcome.dart';

class PasswordResetScreen extends StatefulWidget {
  static const String screenRoute = 'PasswordResetScreen';
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = ' ';
  final FocusNode _focusNode1 = FocusNode();
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      if (!_focusNode1.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode1.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/resetPassword.png'),
                  fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: const Text(
                  'Reset Your Password',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 5),
                )),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 300.0, right: 50, left: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      focusNode: _focusNode1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle:
                              TextStyle(fontSize: 20, color: Colors.white),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyButton(
                      onPressed: () {
                        _focusNode1.unfocus();
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _sendPasswordResetEmail();
                          Navigator.pushNamed(context, LoginScreen.screenRoute);
                        }
                      },
                      color: Colors.black,
                      title: ('Reset Password'),
                    ),
                    TextButton(
                      child: Text(
                        "Not You?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30),
                      ),
                      onPressed: () {
                        _focusNode1.unfocus();
                        Navigator.pushNamed(context, LoginScreen.screenRoute);
                      },
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

  void _sendPasswordResetEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Password reset email sent')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
