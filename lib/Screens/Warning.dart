import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class Warning extends StatefulWidget {
  static const screenRoute = 'test';
  @override
  _WarningState createState() => _WarningState();
}

class _WarningState extends State<Warning> {
  var _data;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: databaseReference.child("data").onValue,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData && snapshot.data.snapshot.value != null) {
          var data = snapshot.data.snapshot.value;
          if (data == "abnormal") {
            Future.delayed(Duration.zero, () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Warning'),
                    content: Text('Data is abnormal'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            });
            return Scaffold(
              body: Center(
                  child: Text("Data: $data", style: TextStyle(fontSize: 20))),
            );
          } else
            return Scaffold(
              body: Center(
                  child:
                      Text("Data not found", style: TextStyle(fontSize: 20))),
            );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
