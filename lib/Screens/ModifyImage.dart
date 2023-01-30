// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:oma/UserProfile/profile_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ModifyImage extends StatefulWidget {
//   static const String screenRoute = 'ModifyImage';
//   @override
//   _ModifyImageState createState() => _ModifyImageState();
// }

// File? imageFile;

// class _ModifyImageState extends State<ModifyImage> {
//   String emailStorage = " ";
//   @override
//   void initState() {
//     setState(() {
//       getData();
//       _uploadImage();
//     });
//   }

//   getData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       emailStorage = prefs.getString('email')!;
//     });
//   }

//   _uploadImage() async {
//     final ref = FirebaseStorage.instance
//         .ref()
//         .child('profileImages')
//         .child(DateTime.now().toString() + '.jgp');
//     await ref.putFile(imageFile!);
//     _imageUrl = await ref.getDownloadURL();
//     final url = await ref.getDownloadURL();
//     FirebaseFirestore.instance.collection('Users').doc(emailStorage)
//       ..update({'image': _imageUrl});
//     setState(() {
//       _imageUrl = url;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Image Picker"),
//         ),
//         body: Container(
//             child: imageFile == null
//                 ? Container(
//                     alignment: Alignment.center,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         ElevatedButton(
//                           onPressed: () {
//                             _getFromGallery();
//                           },
//                           child: Text("PICK FROM GALLERY"),
//                         ),
//                         SizedBox(
//                           height: 40.0,
//                         ),
//                         ElevatedButton(
//                           onPressed: () {
//                             _getFromCamera();
//                           },
//                           child: Text("PICK FROM CAMERA"),
//                         ),
//                       ],
//                     ),
//                   )
//                 : Center(
//                     child: Column(children: [
//                       Container(
//                         padding: EdgeInsets.all(20),
//                         child: Image.file(
//                           imageFile as File,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       ElevatedButton(
//                           onPressed: (() {
//                             _uploadImage();
//                             Navigator.pushNamed(
//                                 context, ProfilePage.screenRoute);
//                             imageFile = null;
//                           }),
//                           child: Text('submit'))
//                     ]),
//                   )));
//   }

//   _getFromGallery() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.gallery,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   _getFromCamera() async {
//     PickedFile? pickedFile = await ImagePicker().getImage(
//       source: ImageSource.camera,
//       maxWidth: 1800,
//       maxHeight: 1800,
//     );
//     if (pickedFile != null) {
//       setState(() {
//         imageFile = File(pickedFile.path);
//       });
//     }
//   }
// }

// String? _imageUrl;
