import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 1),
            child: Image.asset(
              'images/lo2.png',
              height: 200,
              width: 390,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
