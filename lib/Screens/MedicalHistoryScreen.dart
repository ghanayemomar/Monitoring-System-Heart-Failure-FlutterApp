import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oma/Screens/LoginScreen.dart';
import 'package:oma/Screens/SignUpScreen.dart';
import 'package:oma/Screens/welcome.dart';
import 'package:oma/Utils/color_utils.dart';
import 'package:oma/Widget/My_Buttom.dart';
import 'package:oma/main.dart';

class MedicalHistoryPage extends StatefulWidget {
  final String email;
  MedicalHistoryPage({required this.email});

  @override
  _MedicalHistoryPageState createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _AgeController = TextEditingController();
  final TextEditingController _WeightController = TextEditingController();
  final TextEditingController _HeightController = TextEditingController();
  final TextEditingController _MedicationController = TextEditingController();
  final TextEditingController _illnesController = TextEditingController();

  bool _hadHeartAttack = false;
  bool _takesMedication = false;
  bool _hadIllness = false;
  List<String> _previousIllnesses = [];
  String _medication = '';
  String _Blood = 'A+';
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  final FocusNode _focusNode5 = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode1.addListener(() {
      if (!_focusNode1.hasFocus &&
          !_focusNode2.hasFocus &&
          !_focusNode3.hasFocus &&
          !_focusNode4.hasFocus &&
          !_focusNode5.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(fit: StackFit.expand, children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Image.asset(
            "images/resetPassword.png",
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            _focusNode1.unfocus();
            _focusNode2.unfocus();
            _focusNode3.unfocus();
            _focusNode4.unfocus();
            _focusNode5.unfocus();
          },
          child: SingleChildScrollView(
            child: Column(children: [
              SafeArea(
                  child: Text(
                "Medical History",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 34),
              )),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        /// Age ///////////////////////////////////////////////////////////////////////
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            return null;
                          },
                          controller: _AgeController,
                          focusNode: _focusNode5,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Age',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.add_to_drive_sharp,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(height: 10),

                        /// Weight ////////////////////////////////////////////////////////////////////

                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                          controller: _WeightController,
                          focusNode: _focusNode1,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.add_to_drive_sharp,
                              color: Colors.white,
                            ),
                            labelText: 'Weight (KG)',
                          ),
                        ),
                        SizedBox(height: 10),

                        /// Height ////////////////////////////////////////////////////////////////////

                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                          controller: _HeightController,
                          focusNode: _focusNode2,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.add_to_drive_sharp,
                              color: Colors.white,
                            ),
                            labelText: 'Height (CM)',
                          ),
                        ),
                        SizedBox(height: 10),
                        //// Blood Type/////////////////////////////////////
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment(-0.99, 0.0),
                          child: Text(
                            'Choose Blood Type :',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          value: _Blood,
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Select an option';
                            }
                            return null;
                          }),
                          onChanged: ((value) {
                            setState(() {
                              _Blood = value.toString();
                            });
                          }),
                          //  alignment: Alignment.center,
                          dropdownColor: Color.fromARGB(215, 58, 22, 53),
                          elevation: 20,
                          icon: Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          items: <String>[
                            'A+',
                            'A-',
                            'B+',
                            'B-',
                            'O+',
                          ]
                              .map(
                                (e) => DropdownMenuItem(
                                    value: e,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          e,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        // SizedBox(
                                        //   width: 90,
                                        // ),
                                      ],
                                    )),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 10),
                      ],
                    )),
              ),

              /// had Heart attack before ! ////////////////////////////////////////////
              CheckboxListTile(
                title: Text(
                  'Had Heart Attack Before !',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                value: _hadHeartAttack,
                onChanged: (value) {
                  setState(() {
                    _hadHeartAttack = value!;
                  });
                },
              ),

              /// take Medication ///////////////////////////////////////////////////////////////////
              CheckboxListTile(
                title: Text(
                  'Takes Medication !',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                value: _takesMedication,
                onChanged: (value) {
                  setState(() {
                    _takesMedication = value!;
                  });
                },
              ),

              ///Had Illness /////////////////////////////////////////////////////////////////////////
              CheckboxListTile(
                title: Text(
                  'Had Illness !',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                value: _hadIllness,
                onChanged: (value) {
                  setState(() {
                    _hadIllness = value!;
                  });
                },
              ),

              ///midication information /////////////////////////////////////////////////////////
              Visibility(
                visible: _takesMedication,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field Cannot Be Empty';
                      }
                      return null;
                    },
                    controller: _MedicationController,
                    focusNode: _focusNode3,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      labelText: 'Enter medication information',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              /// illness ////////////////////////////////////////////////////////////////////////////////
              Visibility(
                visible: _hadIllness,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field Cannot Be Empty';
                      }
                      return null;
                    },
                    controller: _illnesController,
                    focusNode: _focusNode4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      labelText: 'Enter Your illness',
                    ),

                    // onSaved: (value) {
                    //   setState(() {
                    //     _medication = value!;
                    //   });
                    // },
                  ),
                ),
              ),
              MyButton(
                title: "Submit",
                color: Colors.black,
                onPressed: () {
                  //print(widget.email);
                  if (_formKey.currentState!.validate()) {
                    FirebaseFirestore.instance
                        .collection("Medical")
                        .doc(widget.email)
                        .set({
                      "age": _AgeController.text.trim(),
                      "weight": _WeightController.text.trim() + ' kg',
                      "height": _HeightController.text.trim() + ' cm',
                      "blood_type": _Blood,
                      "had_heart_attack": _hadHeartAttack,
                      "medication_information:": _MedicationController.text,
                      "illnes": _illnesController.text,
                    });

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => LoginScreen())));
                  }
                },
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
