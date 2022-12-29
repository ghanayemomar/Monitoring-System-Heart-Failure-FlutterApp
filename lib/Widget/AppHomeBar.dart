import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class appHomeBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'd');
            },
            child: const Icon(
              Icons.sort,
              size: 30,
              color: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 110),
            child: Image.asset(
              'images/lo1.png',
              color: Colors.white,
              width: 50,
              height: 50,
            ),
          ),
          // Spacer(),
          // Badge(
          //   badgeColor: Colors.red,
          //   padding: EdgeInsets.all(7),
          //   badgeContent: Text(
          //     "",
          //     style: TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pushNamed(context, "filepage");
          //     },
          //     child: Icon(
          //       Icons.notification_add,
          //       color: Colors.black,
          //       size: 31,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
