import 'package:flutter/material.dart';
import './constant.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/care.png',
            width: 36,
            height: 36,
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            'Medical',
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
