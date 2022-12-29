// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';

// class InkWellCard extends StatefulWidget {
//   // const InkWellCard({super.key});

//   @override
//   State<InkWellCard> createState() => _InkWellCardState();
//   final String title;
//   final String imageUrl;
//   const InkWellCard({
//     required this.title,
//     required this.imageUrl,
//   });
// }

// class _InkWellCardState extends State<InkWellCard> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: null,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         elevation: 10,
//         color: Colors.deepPurple,
//         margin: EdgeInsets.only(top: 40, right: 100, left: 100),
//         child: Column(
//           children: <Widget>[
//             Stack(children: <Widget>[
//               ClipRRect(
//                   // ignore: prefer_const_constructors
//                   borderRadius: BorderRadius.only(
//                       // ignore: prefer_const_constructors
//                       topLeft: Radius.circular(15),
//                       topRight: Radius.circular(15)),
//                   child: Image.asset(
//                     'images/locationservices.png',
//                     color: Colors.white,
//                     height: 250,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ))
//             ]),
//             Padding(
//               padding: EdgeInsets.all(20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
//                   Row(
//                     // ignore: prefer_const_literals_to_create_immutables
//                     children: <Widget>[
//                       const Icon(
//                         Icons.location_on,
//                         color: Colors.white,
//                       ),
//                       // ignore: prefer_const_constructors
//                       SizedBox(width: 6),
//                       const Text('title',
//                           style: TextStyle(color: Colors.white)),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
