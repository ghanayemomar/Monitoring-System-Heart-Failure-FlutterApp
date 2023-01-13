import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user.dart';
import 'Appbar_Widget.dart';
import 'Image_Widget.dart';
import 'user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
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
      'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80';

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
      appBar: buildAppBar(context),
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
            backgroundColor: Colors.deepPurpleAccent,
            body: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                imageWidget(
                  imagePath: image,
                  onClicked: () async {},
                ),
                const SizedBox(height: 24),
                buildName(user),
                const SizedBox(height: 24),
                const SizedBox(height: 24),
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
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: mPrimaryTextColor),
          ),
          const SizedBox(height: 16),
          Text(
            emailStorage,
            style: TextStyle(color: Colors.white, fontSize: 20),
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
      height: 24,
      child: VerticalDivider(),
    );

Widget buildButton(BuildContext context, String value, String text) =>
    MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),
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
