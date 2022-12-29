// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:oma/profile/body.dart';
// import 'package:oma/profile/size_config.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     return Scaffold(
//       appBar: buildAppBar(),
//       body: Body(),
//       // We are not able to BottomNavigationBar because the icon parameter dont except SVG
//       // We also use Provied to manage the state of our Nav
//       // bottomNavigationBar: MyBottomNavBar(),
//     );
//   }

//   AppBar buildAppBar() {
//     return AppBar(
//       leading: IconButton(
//         icon: Image.asset("images/hhh.png"),
//         onPressed: () {},
//       ),
//       // On Android by default its false
//       centerTitle: true,
//       title: Image.asset("images/hhh.png"),
//       actions: <Widget>[
//         IconButton(
//           icon: Image.asset("images/hhh.png"),
//           onPressed: () {},
//         ),
//         SizedBox(
//           // It means 5 because by out defaultSize = 10
//           width: SizeConfig.defaultSize! * 0.5,
//         )
//       ],
//     );
//   }
// }
