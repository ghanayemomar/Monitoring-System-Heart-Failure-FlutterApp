import 'package:flutter/material.dart';
// import 'package:flutter_medical/screen/reserve/reserve_screen.dart';
import './header_logo.dart';
import './menu_card.dart';
import './my_header.dart';
import './constant.dart';

class WelcomeScreenTesting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MyHeader(
          height: 333,
          imageUrl: 'images/abc.png',
          child: Column(
            children: <Widget>[
              HeaderLogo(),
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
                  color: mTitleTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Lorem ipsum dolor sit amet,\n consectetuer adipiscing elit',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
                size: 36,
              ),
              SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [mBackgroundColor, mSecondBackgroundColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Our Health\nServices',
                        style: TextStyle(
                          color: mTitleTextColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.menu,
                        color: mSecondBackgroundColor,
                        size: 36,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MenuCard(
                        imageUrl: 'images/care.png',
                        title: 'General Practice',
                        press: () {}),
                    MenuCard(
                      imageUrl: 'images/care.png',
                      title: 'Specialist',
                      press: () {},
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    MenuCard(
                      imageUrl: 'images/care.png',
                      title: 'Sexual Health',
                      press: () {},
                    ),
                    MenuCard(
                      imageUrl: 'images/care.png',
                      title: 'Immunisation',
                      press: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
