import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90)),
        color: Colors.black,
        gradient: LinearGradient(
          colors: [(Colors.white), Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Image.asset(
              "images/lo1.png",
              height: 200,
              width: 200,
            ),
          ),
          const Text(
            "Safe Health Care",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
                fontFamily: 'IndieFlower'),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, top: 20),
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                // Write Click Listener Code Here.

                // Write Click Listener Code Here
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          )
        ],
      )),
    );
  }
}
