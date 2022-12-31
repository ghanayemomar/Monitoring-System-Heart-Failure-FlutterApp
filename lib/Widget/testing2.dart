import 'package:flutter/material.dart';
import './testing.dart';

class testingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MenuCard(
              imageUrl: 'images/care.png',
              title: 'General Practice',
              press: () {},
            ),
            MenuCard(
              imageUrl: 'images/care.png',
              title: 'Specialist',
              press: () {},
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            MenuCard(
              imageUrl: 'images/care.png',
              title: 'Sexual Health',
              press: () {},
            ),
            MenuCard(
              imageUrl: 'images/care.png',
              title: 'Immunisation',
              press: () {},
            ),
          ],
        ),
      ],
    );
  }
}
