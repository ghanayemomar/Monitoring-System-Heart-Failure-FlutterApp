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
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: heartAnimationIcon(),
          ),
          const SizedBox(
            width: 15,
          ),
          const Text(
            'Safe Drive',
            style: TextStyle(
                fontSize: 38,
                color: mTitleTextColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
