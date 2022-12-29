// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// import '../Widget/HomePicture.dart';
import '../Widget/AppHomeBar.dart';
// import '../Widget/heartAnimation.dart';
import '../Widget/LineChartSample.dart';
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
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'images/lo1.png',
            color: Colors.white,
            width: 50,
            height: 50,
          ),
          leading: IconButton(
            onPressed: () => Navigator.pushNamed(context, 'd'),
            icon: Icon(Icons.sort),
          ),
        ),
        body: ListView(children: [
          InkWell(
            onTap: null,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              color: Colors.deepPurple,
              margin: EdgeInsets.only(top: 40, right: 100, left: 100),
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    ClipRRect(
                        // ignore: prefer_const_constructors
                        borderRadius: BorderRadius.only(
                            // ignore: prefer_const_constructors
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.asset(
                          'images/locationservices.png',
                          // color: Colors.white,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                  ]),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(width: 6),
                            const Text("Location Servies",
                                style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: null,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              color: Colors.deepPurple,
              margin: EdgeInsets.only(top: 40, right: 100, left: 100),
              child: Column(
                children: <Widget>[
                  Stack(children: <Widget>[
                    ClipRRect(
                        // ignore: prefer_const_constructors
                        borderRadius: BorderRadius.only(
                            // ignore: prefer_const_constructors
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                        child: Image.asset(
                          'images/locationservices.png',
                          // color: Colors.white,
                          height: 250,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                  ]),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: <Widget>[
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            // ignore: prefer_const_constructors
                            SizedBox(width: 6),
                            const Text("Location Servies",
                                style: TextStyle(color: Colors.white)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ])

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
