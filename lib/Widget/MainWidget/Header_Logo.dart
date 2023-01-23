import 'package:flutter/material.dart';
import 'package:oma/Widget/AnimatedWidget/heartAnimation.dart';
import './constant.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Padding(
            padding: const EdgeInsets.only(left: 10),
            child: heartAnimationIcon(
              iconSize: 90,
              x: 100,
            ),
          ),
          const Text(
            'Safe Drive',
            style: TextStyle(
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.w900,
                letterSpacing: 8),
          ),
        ],
      ),
    );
  }
}
