import 'package:flutter/material.dart';
import 'dart:async';

class BpnWidget extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final int BPN;

  // ignore: non_constant_identifier_names
  const BpnWidget({super.key, required this.BPN});
  @override
  _BpnWidgetState createState() => _BpnWidgetState();
}

class _BpnWidgetState extends State<BpnWidget>
    with SingleTickerProviderStateMixin {
  Color textColor = Colors.red;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(microseconds: 300), (timer) {
      updateColor(widget.BPN);
    });
  }

  void updateColor(int x) {
    setState(() {
      if (x < 110 && x > 60) {
        textColor = Colors.blueAccent;
      } else {
        textColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'BPN: ' + widget.BPN.toString(),
        textAlign: TextAlign.end,
        style: TextStyle(
            color: textColor,
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 0),
      ),
    );
  }
}
