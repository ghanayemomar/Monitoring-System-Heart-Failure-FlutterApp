import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  final IconData icon;
  final Function() onPress;

  SlideItem(
      {Key? key,
      required this.img,
      required this.title,
      required this.description,
      required this.icon,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 15,
        bottom: 5.0,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.15,
        child: InkWell(
          onDoubleTap: onPress,
          child: Card(
            color: Colors.deepPurple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            elevation: 10,
            child: Column(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 3.2,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "$img",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 7.0),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            icon,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "$title",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
