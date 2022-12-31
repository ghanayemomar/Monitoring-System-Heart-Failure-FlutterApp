import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:oma/UserProfile/profile_page.dart';
import './Slide_Item.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 2.3,
            width: MediaQuery.of(context).size.width,
            child: ListView(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      img: 'images/w5.jpg',
                      title: "Location Services",
                      description: "address",
                      icon: Icons.location_on,
                      onPress: () {
                        Navigator.pushNamed(context, ProfilePage.screenRoute);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      img: 'images/w6.jpg',
                      title: "Emergency",
                      description: "address",
                      icon: Icons.emergency,
                      onPress: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SlideItem(
                      img: 'images/w3.jpg',
                      title: "ECG Monitoring",
                      description: "address",
                      icon: Icons.monitor_heart,
                      onPress: () {},
                    ),
                  ),
                ])),
      ],
    );
  }
}
