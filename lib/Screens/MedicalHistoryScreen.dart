import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:oma/Utils/color_utils.dart';
import 'package:oma/main.dart';

class MedicalHistoryPage extends StatefulWidget {
  @override
  _MedicalHistoryPageState createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  final _formKey = GlobalKey<FormState>();
  late int _age;
  late int _weight;

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
      if (!_focusNode1.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
    _focusNode2.addListener(() {
      if (!_focusNode2.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
    _focusNode3.addListener(() {
      if (!_focusNode3.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
    _focusNode4.addListener(() {
      if (!_focusNode4.hasFocus) {
        FocusScope.of(context).unfocus();
      }
    });
    _focusNode5.addListener(() {
      if (!_focusNode5.hasFocus) {
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
                                Navigator.pop(context);
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
                        TextFormField(
                          focusNode: _focusNode5,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Age',
                              labelStyle: TextStyle(color: Colors.white),
                              prefixIcon: Icon(
                                Icons.add_to_drive_sharp,
                                color: Colors.white,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your age';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _age = int.parse(value!);
                            });
                          },
                        ),
                        SizedBox(height: 10),

                        /// Weight ////////////////////////////////////////////////////////////////////

                        TextFormField(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _weight = int.parse(value!);
                            });
                          },
                        ),
                        SizedBox(height: 10),

                        /// Height ////////////////////////////////////////////////////////////////////

                        TextFormField(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your weight';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _weight = int.parse(value!);
                            });
                          },
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
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    itemCount: _previousIllnesses.length,
                    itemBuilder: (context, index) {
                      return Text(_previousIllnesses[index]);
                    },
                  ),
                ),
                Visibility(
                  visible: _takesMedication,
                  child: TextFormField(
                    focusNode: _focusNode3,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      labelText: 'Enter medication information',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field Cannot Be Empty';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _medication = value!;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: _hadIllness,
                  child: TextFormField(
                    focusNode: _focusNode4,
                    decoration: const InputDecoration(
                      labelStyle: TextStyle(color: Colors.white, fontSize: 18),
                      labelText: 'Enter Your illness',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field Cannot Be Empty';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _medication = value!;
                      });
                    },
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
                  onPressed: () async {
                    // if (_formKey.currentState!.validate()) {
                    //   null;
                    // }

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: ((context) => const MyApp())));
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
