import 'package:flutter/material.dart';
import './constant.dart';

class MenuCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function() press;

  const MenuCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: <Widget>[
          Image.asset(
            imageUrl,
            width: 135,
            height: 100,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              title,
              style: const TextStyle(
                color: mTitleTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
