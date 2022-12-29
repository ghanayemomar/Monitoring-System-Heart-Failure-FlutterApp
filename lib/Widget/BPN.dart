import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class BPNWidget extends StatefulWidget {
  const BPNWidget({super.key});

  @override
  State<BPNWidget> createState() => _BPNWidgetState();
}

class _BPNWidgetState extends State<BPNWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(alignment: Alignment.bottomCenter, children: <Widget>[
        Image.asset('assets/images/Group 10015.png'),
        const Positioned(
          top: 170,
          child: Text(
            " 66 BPN",
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 0),
          ),
        ),
      ]),
    );
  }
}
