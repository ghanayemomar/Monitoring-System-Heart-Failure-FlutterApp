import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:oma/Screens/LoginScreen.dart';
import 'package:oma/Screens/SignUpScreen.dart';
import 'package:oma/Screens/welcome.dart';
import 'package:oma/Utils/color_utils.dart';
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
      body: GestureDetector(
        onTap: () {
          _focusNode1.unfocus();
          _focusNode2.unfocus();
          _focusNode3.unfocus();
          _focusNode4.unfocus();
          _focusNode5.unfocus();
        },
        // onLongPressMoveUpdate: ,

        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            hexStringToColor("CB2B93"),
            hexStringToColor("9546C4"),
            hexStringToColor("5E61F4"),
          ], begin: Alignment.topCenter, end: Alignment.center)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 30),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            SignUpScreen())));
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
                                'Medical History',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),

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

                          // onSaved: (value) {
                          //   setState(() {
                          //     _age = int.parse(value!);
                          //   });
                          // },
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
                            labelText: 'Weight (in kg)',
                          ),

                          // onSaved: (value) {
                          //   setState(() {
                          //     _weight = int.parse(value!);
                          //   });
                          // },
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
                            labelText: 'Height (in cm)',
                          ),

                          // onSaved: (value) {
                          //   setState(() {
                          //     _weight = int.parse(value!);
                          //   });
                          // },
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
                // SizedBox(
                //   height: 30,
                //   child: ListView.builder(
                //     itemCount: _previousIllnesses.length,
                //     itemBuilder: (context, index) {
                //       return Text(_previousIllnesses[index]);
                //     },
                //   ),
                // ),
                ///midication information /////////////////////////////////////////////////////////
                Visibility(
                  visible: _takesMedication,
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

                    // onSaved: (value) {
                    //   setState(() {
                    //     _medication = value!;
                    //   });
                    // },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                /// illness ////////////////////////////////////////////////////////////////////////////////
                Visibility(
                  visible: _hadIllness,
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
                TextButton(
                  child: Text(
                    "Submit",
                    // maxLines: 50,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    //print(widget.email);
                    if (_formKey.currentState!.validate()) {
                      FirebaseFirestore.instance
                          .collection("Users")
                          .doc(widget.email)
                          .update({
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
        ),
      ),
    );
  }
}
