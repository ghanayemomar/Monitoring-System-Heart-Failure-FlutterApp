import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'HomeView.dart';
import 'appHome.dart';

class HomeP extends StatefulWidget {
  @override
  _HomePState createState() => _HomePState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

class _HomePState extends State<HomeP> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          appHome(),

          // Container(
          //
          //   // height: 500,
          //   padding: EdgeInsets.only(top: 15),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(35),
          //       topRight: Radius.circular(35),
          //     ),
          //   ),
          // ),
          HomeView(),
          Container(
            child: Row(
              children: [
                Text(
                  " Application Services : ",
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 110, top: 4),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                getExpanded('lo6.png', 'Personal Details', 'File'),
                getExpanded('lo4.png', 'Location', 'Emergency Service'),
              ],
            ),
          ),
          Container(
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                getExpanded('lo3.png', 'Profile', 'Service'),
                getExpanded('lo5.png', 'Emergency Call', 'Service'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 70,
        color: Colors.black,
        items: [
          const Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'prof');
            },
            child: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.file_copy,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
        // onTap: (index) {
        //   //Handle button tap
        // },
      ),
    );
  }

  Expanded getExpanded(String image, String mainText, String SeText) {
    return Expanded(
        child: DefaultTextStyle.merge(
      style: const TextStyle(
        fontSize: 10.0,
        //fontFamily: 'monospace',
      ),
      child: Container(
        margin: const EdgeInsets.only(
          left: 10.0,
          right: 10.0,
          top: 10.0,
          bottom: 10.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
          boxShadow: [BoxShadow()],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/$image',
              height: 65.0,
            ),
            const SizedBox(
              height: 9.0,
            ),
            DefaultTextStyle(
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black),
                child: Text(mainText)),
            const SizedBox(
              height: 9.0,
            ),
            DefaultTextStyle(
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0,
                    color: Colors.black),
                child: Text(SeText)),
          ],
        ),
      ),
    ));
  }
}
