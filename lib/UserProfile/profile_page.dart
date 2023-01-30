import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oma/Widget/AnimatedWidget/AnimatedIconBack.dart';
import 'package:oma/Widget/AnimatedWidget/AnimatedIconDrawer.dart';
import 'package:oma/Widget/AnimatedWidget/AnimatedIconWelcome.dart';
import 'package:oma/Widget/AnimatedWidget/profileanimatediconback.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user.dart';
import 'Image_Widget.dart';
import 'user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../Widget/MainWidget/constant.dart';

class ProfilePage extends StatefulWidget {
  //ProfilePage({required this.email});
  static const screenRoute = 'ProfilePage';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String fname = '';
  String lname = '';
  String add = '';
  String name = '';
  String image =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

  String last_name = '';
  String first_name = '';
  String age = '';
  String address = '';
  String Type = '';
  String Gender = '';
  String phone = '';
  String token = '';
  String emailStorage = " ";
  @override
  void initState() {
    setState(() {
      getData();
    });
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      emailStorage = prefs.getString('email')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      // appBar: buildAppBar(context),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(emailStorage)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Scaffold(
                body: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Loading",
                  style: TextStyle(fontSize: 24),
                )
              ],
            )));

          fname = (snapshot.data!['first_name']);
          lname = snapshot.data!['last_name'];
          add = snapshot.data!['address'];
          first_name = fname[0].toUpperCase() + fname.substring(1);
          last_name = lname[0].toUpperCase() + lname.substring(1);
          name = first_name + ' ' + last_name;

          address = add[0].toUpperCase() + add.substring(1);
          Type = snapshot.data!['Type'];
          Gender = snapshot.data!['Gender'];
          token = snapshot.data!['token_driver'];
          phone = snapshot.data!['phone'];

          return Scaffold(
            body: Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Image.asset(
                  "images/resetPassword.png",
                  fit: BoxFit.cover,
                ),
              ),
              ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      ProfileAnimatedDrawer(),
                      SizedBox(
                        width: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: imageWidget(
                          imagePath: image,
                          onClicked: () async {},
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  buildName(user),
                  const SizedBox(height: 24),
                  const SizedBox(height: 15),
                  // NumbersWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildButton(context, token, 'Token'),
                      buildDivider(),
                      buildButton(context, Type, 'Type'),
                      buildDivider(),
                      buildButton(context, Gender, 'Gender'),
                    ],
                  ),
                  const SizedBox(height: 48),
                  buildAbout(user),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            emailStorage,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.black,
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
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            first_name,
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
                            last_name,
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
                            address,
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
                            "Phone: ",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            phone,
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

Widget buildDivider() => Container(
      height: 25,
      child: VerticalDivider(
        color: Colors.white,
      ),
    );

Widget buildButton(BuildContext context, String value, String text) =>
    MaterialButton(
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            value,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 2),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
