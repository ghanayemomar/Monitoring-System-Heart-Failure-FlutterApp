import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:oma/profile/body.dart';
import 'package:oma/profile/size_config.dart';

import 'edit.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(''),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Edit(),
                    ));
              },
              icon: Icon(Icons.edit)),
        ],
      ),
      body: Body(),
      // bottomNavigationBar: MyBottomNavBar(),
    );
  }

  // AppBar buildAppBar() {
  //   return AppBar(
  //     backgroundColor: kPrimaryColor,
  //     leading: SizedBox(),
  //     // On Android it's false by default
  //     centerTitle: true,
  //     title: Text("Profile"),
  //     actions: <Widget>[
  //       TextButton(
  //         onPressed: () {
  //         },
  //         child: Text(
  //           "Edit",
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: SizeConfig.defaultSize! * 1.6, //16
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
