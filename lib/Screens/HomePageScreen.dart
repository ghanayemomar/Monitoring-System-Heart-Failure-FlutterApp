// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oma/Screens/header.dart';
import 'package:oma/Screens/welcome.dart';
import 'package:oma/UserProfile/profile_page.dart';
import 'package:oma/Widget/MainWidget/Welcome_Screen.dart';
import '../Widget/MainWidget2/MainWidget.dart';
import 'package:oma/drawer/navigation_drawer.dart';
import '../Widget/AnimatedWidget/LineChartSample.dart';
import '../Widget/InkWellCard.dart';

class HomePageScreen extends StatefulWidget {
  static const String screenRoute = 'HomePageScreen';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(body: WelcomeScreenTesting()

        // bottomNavigationBar: CurvedNavigationBar(
        //   backgroundColor: Colors.transparent,
        //   onTap: (index) {},
        //   height: 70,
        //   color: Colors.black,
        //   items: [
        //     const Icon(
        //       Icons.home,
        //       size: 30,
        //       color: Colors.white,
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.pushNamed(context, 'prof');
        //       },
        //       child: const Icon(
        //         Icons.person,
        //         size: 30,
        //         color: Colors.white,
        //       ),
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         // Navigator.pushNamed(context, SimpleMapScreen.screenRoute);
        //       },
        //       child: const Icon(
        //         Icons.map,
        //         size: 30,
        //         color: Colors.white,
        //       ),
        //     )
        //   ],
        // ),
        );
  }

//   Expanded getExpanded(String image, String mainText, String SeText) {
//     return Expanded(
//         child: DefaultTextStyle.merge(
//       style: const TextStyle(
//         fontSize: 10.0,
//         //fontFamily: 'monospace',
//       ),
//       child: Container(
//         margin: const EdgeInsets.only(
//           left: 10.0,
//           right: 10.0,
//           top: 10.0,
//           bottom: 10.0,
//         ),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(14),
//             topRight: Radius.circular(14),
//             bottomLeft: Radius.circular(14),
//             bottomRight: Radius.circular(14),
//           ),
//           boxShadow: [BoxShadow()],
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(
//               'images/$image',
//               height: 65.0,
//             ),
//             const SizedBox(
//               height: 9.0,
//             ),
//             DefaultTextStyle(
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16.0,
//                     color: Colors.black),
//                 child: Text(mainText)),
//             const SizedBox(
//               height: 9.0,
//             ),
//             DefaultTextStyle(
//                 style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 10.0,
//                     color: Colors.black),
//                 child: Text(SeText)),
//           ],
//         ),
//       ),
//     ));
//   }
}
