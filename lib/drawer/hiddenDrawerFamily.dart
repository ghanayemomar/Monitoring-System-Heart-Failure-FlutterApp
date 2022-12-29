// import 'package:flutter/material.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
// import 'package:oma/Screens/HomePageScreen.dart';
// import 'package:oma/Screens/welcome.dart';
// import 'package:oma/profile/prrofile_screen.dart';

// class HiddenDrawer extends StatefulWidget {
//   static const String screenRoute = 'HiddenDrawer';

//   @override
//   State<HiddenDrawer> createState() => _HiddenDrawerState();
// }

// class _HiddenDrawerState extends State<HiddenDrawer> {
//   List<ScreenHiddenDrawer> _pages = [];
//   final myTextStyle = const TextStyle(
//       fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white);
//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//               name: 'Home Page',
//               baseStyle: myTextStyle,
//               selectedStyle: myTextStyle,
//               colorLineSelected: Colors.deepPurple),
//           HomePageScreen()),
//       ///////////////////
//       //////////////////
//       /////////////////
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//               name: 'Profile',
//               baseStyle: myTextStyle,
//               selectedStyle: myTextStyle,
//               colorLineSelected: Colors.deepPurple),
//           ProfileScreen()),
//       ///////////////////
//       //////////////////
//       /////////////////
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//               name: 'Terms',
//               baseStyle: myTextStyle,
//               selectedStyle: myTextStyle),
//           HomePageScreen()),
//       ///////////////////
//       //////////////////
//       /////////////////
//       ScreenHiddenDrawer(
//           ItemHiddenMenu(
//               onTap: () => {
//                     Navigator.of(context).pushReplacement(
//                       MaterialPageRoute(
//                         builder: ((context) => WelcomeScreen()),
//                       ),
//                     )
//                   },
//               name: 'Logout',
//               baseStyle: myTextStyle,
//               selectedStyle: myTextStyle),
//           WelcomeScreen()),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HiddenDrawerMenu(
//       backgroundColorMenu: Colors.deepPurple.shade200,
//       screens: _pages,
//       initPositionSelected: 0,
//       slidePercent: 70,
//       // contentCornerRadius: 100,
//       boxShadow: [],
//     );
//   }
// }
