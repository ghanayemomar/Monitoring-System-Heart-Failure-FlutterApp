import 'package:flutter/material.dart';
import 'package:oma/profile/size_config.dart';

import 'info.dart';
import 'profile_menu_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Info(
            image: "images/om.jpg",
            name: "Omar Gh",
            email: "omar@gmail.com",
          ),
          SizedBox(height: SizeConfig.defaultSize! * 3), //20
          ProfileMenuItem(
            iconSrc: "images/lo1.png",
            title: "Health status",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "images/lo4.png",
            title: "Safe Health Care",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "images/lo3.png",
            title:
                "A urologist is a medical doctor specializing\n in conditions that affect the urinary tract \nin men, women and children,",
            press: () {},
          ),
        ],
      ),
    );
  }
}
