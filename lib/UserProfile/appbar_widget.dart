import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.deepPurpleAccent,
    elevation: 1,
    actions: [
      // IconButton(
      //   icon: Icon(icon),
      //   onPressed: () {},
      // ),
    ],
  );
}
