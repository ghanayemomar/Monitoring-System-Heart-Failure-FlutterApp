// import 'package:flutter/material.dart';
// import 'package:flutter_mailer/flutter_mailer.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Mailer Example',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Mailer Example'),
//         ),
//         body: Center(
//           child: RaisedButton(
//             onPressed: sendEmail,
//             child: Text('Send email'),
//           ),
//         ),
//       ),
//     );
//   }

//   void sendEmail() async {
//     final MailOptions mailOptions = MailOptions(
//       body: 'Mail body',
//       subject: 'Subject',
//       recipients: ['recipient@example.com'],
//       isHTML: false,
//     );

//     await FlutterMailer.send(mailOptions);
//   }
// }
