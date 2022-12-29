import 'package:flutter/material.dart';
import 'package:oma/Widget/heartAnimation.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 1),
              child: heartAnimationIcon()),
        ],
      ),
    );
  }
}
