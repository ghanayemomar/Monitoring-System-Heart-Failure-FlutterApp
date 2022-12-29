import 'package:flutter/material.dart';

class MedicalHistoryPage extends StatefulWidget {
  @override
  _MedicalHistoryPageState createState() => _MedicalHistoryPageState();
}

class _MedicalHistoryPageState extends State<MedicalHistoryPage> {
  final _formKey = GlobalKey<FormState>();
  late int _age;
  late int _weight;
  late String _selectedBloodType = 'A+';
  bool _hadHeartAttack = false;
  bool _takesMedication = false;
  bool _hadIllness = false;
  List<String> _previousIllnesses = [];
  String _medication = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'Age', icon: Icon(Icons.add_to_drive_sharp)),
              validator: (value) {
                if (value!.isEmpty) {
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
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (in kg)',
              ),
              validator: (value) {
                if (value!.isEmpty) {
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
            Column(
              children: [
                DropdownButtonFormField(
                  menuMaxHeight: 250,
                  value: _selectedBloodType,
                  hint: Text('Select your blood type'),
                  items: [
                    DropdownMenuItem(
                      value: 'A+',
                      child: Text('A+'),
                    ),
                    DropdownMenuItem(
                      value: 'A-',
                      child: Text('A-'),
                    ),
                    DropdownMenuItem(
                      value: 'B+',
                      child: Text('B+'),
                    ),
                    DropdownMenuItem(
                      value: 'B-',
                      child: Text('B-'),
                    ),
                    DropdownMenuItem(
                      value: 'O+',
                      child: Text('O+'),
                    ),
                    DropdownMenuItem(
                      value: 'O-',
                      child: Text('O-'),
                    ),
                    DropdownMenuItem(
                      value: 'AB+',
                      child: Text('AB+'),
                    ),
                    DropdownMenuItem(
                      value: 'AB-',
                      child: Text('AB-'),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedBloodType = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Had Heart Attack Before'),
                  value: _hadHeartAttack,
                  onChanged: (value) {
                    setState(() {
                      _hadHeartAttack = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Takes Medication'),
                  value: _takesMedication,
                  onChanged: (value) {
                    setState(() {
                      _takesMedication = value!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text('Had Illness'),
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
                    decoration: const InputDecoration(
                      labelText: 'Enter medication information',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
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
                    decoration: const InputDecoration(
                      labelText: 'Enter Your illness',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
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
                  child: Text("Submit"),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                  },
                ),
              ],
            ),
          ]),
        ),
      ),
    ));
  }
}
