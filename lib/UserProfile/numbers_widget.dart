import 'package:flutter/material.dart';
import 'package:oma/Screens/constant.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildButton(context, '23', 'Age'),
          buildDivider(),
          buildButton(context, 'Driver', 'Type'),
          buildDivider(),
          buildButton(context, 'Male', 'Gender'),
        ],
      );
  Widget buildDivider() => Container(
        height: 24,
        child: VerticalDivider(
          color: mPrimaryTextColor,
        ),
      );

  Widget buildButton(BuildContext context, String value, String text) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: mPrimaryTextColor),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: mPrimaryTextColor),
            ),
          ],
        ),
      );
}
