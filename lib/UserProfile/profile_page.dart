import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'Appbar_Widget.dart';
import 'Numbers_Widget.dart';
import 'Image_Widget.dart';
import 'user_preferences.dart';
import '../Widget/MainWidget/constant.dart';

class ProfilePage extends StatefulWidget {
  static const screenRoute = 'ProfilePage';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}
// void TextStyle()

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: Scaffold(
        // backgroundColor: Colors.deepPurpleAccent,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
            colors: [mBackgroundColor, mSecondBackgroundColor],
          )),
          child: Column(
            children: [
              imageWidget(
                imagePath: user.imagePath,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              buildName(user),
              const SizedBox(height: 24),
              const SizedBox(height: 24),
              NumbersWidget(),
              const SizedBox(height: 48),
              buildAbout(user),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: mPrimaryTextColor),
          ),
          const SizedBox(height: 4),
          Text(
            user.email,
            style: TextStyle(color: mPrimaryTextColor),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.deepPurple,
              elevation: 100,
              shadowColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.abc,
                            color: Colors.white,
                          ),
                          const Text(
                            "First Name: ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            user.First_Name,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 16, height: 1.4, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.abc,
                            color: Colors.white,
                          ),
                          const Text(
                            "Last Name: ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            user.Last_Name,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 16, height: 1.4, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          const Text(
                            "Address: ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            user.Address,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 16, height: 1.4, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          const Text(
                            "Phone Number: ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            user.Phone_Number,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontSize: 16, height: 1.4, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
