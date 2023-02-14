import 'package:flutter/material.dart';
import 'dart:async';
import '../Widget/MainWidget/constant.dart';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:oma/Screens/HomePageScreen.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    //   'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

//Stream<int> stream;
class HealthMonitoringWidget extends StatefulWidget {
  final int x;
  const HealthMonitoringWidget({super.key, required this.x});
  @override
  _HealthMonitoringWidgetState createState() => _HealthMonitoringWidgetState();
}

class _HealthMonitoringWidgetState extends State<HealthMonitoringWidget>
    with SingleTickerProviderStateMixin {
  bool notificationShown = false;
  late AnimationController _animationController;
  double _iconScale = 1;
  Color color = mSecondBackgroundColor;
  String text = 'normal';
  int heartSpeed = 1100;
  IconData icon = Icons.favorite;

  @override
  // void initState() {

  // }

  int _counter = 0;

  var serverToken =
      "fd1vCYK_QnOiwLg64Aj2vD:APA91bH-cZhIpjhN__p_NBaDxn1VGqmsUNpbXIMKTRTbQiJBqq5DgFFACsz_GjQndPkfEoKwi1A5VK9lBsyiSL-8EKwzUgi2PkJj8SkSnD_Ap_3epwa2FZX149xpdZ00ftShWPflLInV";

  sendNotify(String title, String body) async {
    await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'key=$serverToken',
      },
      body: jsonEncode(<String, dynamic>{
        'notification': <String, dynamic>{
          'body': body.toString(),
          'title': title.toString(),
        },
        'priority': 'High',
        'data': <String, dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        },
        'to': await FirebaseMessaging.instance.getToken()
      }),
    );
  }

  Future<void> init8888() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    var fbm = FirebaseMessaging.instance;

    initalMessage() async {
      var message = await FirebaseMessaging.instance.getInitialMessage();
      if (message != null) {
        Navigator.push(context, MaterialPageRoute(
          builder: (BuildContext context) {
            return HomePageScreen();
          },
        ));
      }
    }

    fbm.getToken().then((token) {
      print("Token:");
      print(token);
      print("Token:");
    });
  }

  @override
  void initState() {
    init8888();
    super.initState();
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1100), vsync: this);
    _animationController.addListener(() {
      setState(() {
        _iconScale = 1.0 + _animationController.value * 0.4;
      });
    });
    _animationController.repeat(reverse: true);
    // Set up a timer to check the value of x every second
    Timer.periodic(const Duration(microseconds: 1), (timer) {
      updateColor(widget.x);
    });
//to listen for the function state :
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        print(notification.title);
        print(notification.body);

        ///when the notification is sent
        /*
        AwesomeDialog(
            context: context,
            title: "title",
            body: Text("${notification.body}"))
          ..show();*/
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                // channel.description,
                color: Color(0xff6a515e),
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext context) {
          return HomePageScreen();
        },
      ));
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body.toString())],
                  ),
                ),
              );
            });
      }
    });
  }

  void updateColor(int x) {
    setState(() {
      if (x <= 100 && x >= 60) {
        color = Colors.blueAccent;
        text = 'Normal';
        icon = Icons.favorite;
        notificationShown = false;
      } else {
        if (!notificationShown) {
          showNotification();
          notificationShown = true;
        }
        color = Colors.red;
        text = 'Abnormal';
        icon = Icons.heart_broken_sharp;
      }
    });
  }

  void showNotification() {
    setState(() {
      _counter++;
    });
    flutterLocalNotificationsPlugin.show(
        0,
        "Notification $_counter",
        "URGENT: The Driver is experiencing unnatural changes in his heart beats!",
        NotificationDetails(
            android: AndroidNotificationDetails(channel.id, channel.name,
                importance: Importance.high,
                color: Color(0xff6a515e),
                playSound: true,
                icon: '@mipmap/ic_launcher')));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 90),
        Transform.scale(
          scale: _iconScale,
          child: IconButton(
            icon: Icon(icon, color: color),
            iconSize: 145,
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'BPM: ' + widget.x.toString(),
            textAlign: TextAlign.end,
            style: TextStyle(
                color: color,
                fontFamily: 'Poppins',
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 0),
          ),
        ),
        Card(
          elevation: 20,
          // surfaceTintColor: Colors.amber,
          shadowColor: color,
          color: mSecondBackgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: mSecondBackgroundColor),
            borderRadius: const BorderRadius.all(Radius.circular(40)),
          ),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(
                letterSpacing: 5,
                fontSize: 40,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
