import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user.dart';
import 'Appbar_Widget.dart';
import 'Numbers_Widget.dart';
import 'Image_Widget.dart';
import 'user_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  String email = "muhammed@gmail.com";
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
  //String email = "muhammed@gmail.com";
  String phone = '';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(widget.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Scaffold(
              backgroundColor: Colors.deepPurpleAccent,
              body: Center(
                  child: Text(
                'Profile...',
                style: TextStyle(fontSize: 22),
              )),
            );
          fname = (snapshot.data!['first_name']);
          lname = snapshot.data!['last_name'];
          add = snapshot.data!['address'];
          first_name = fname[0].toUpperCase() + fname.substring(1);
          last_name = lname[0].toUpperCase() + lname.substring(1);
          name = first_name + ' ' + last_name;
          age = snapshot.data!['age'];
          address = add[0].toUpperCase() + add.substring(1);
          Type = snapshot.data!['Type'];
          Gender = snapshot.data!['Gender'];
          // email = snapshot.data!['email'];
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
                NumbersWidget(),
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
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 16),
          Text(
            widget.email,
            style: TextStyle(color: Colors.white, fontSize: 20),
          )
        ],
      );

  Widget buildAbout(User user) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
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
                          Icon(
                            Icons.boy_rounded,
                            color: Colors.white,
                          ),
                          Text(
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
                          Icon(
                            Icons.boy_rounded,
                            color: Colors.white,
                          ),
                          Text(
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
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          Text(
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
                          Icon(
                            Icons.numbers_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            "Phone Number: ",
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
