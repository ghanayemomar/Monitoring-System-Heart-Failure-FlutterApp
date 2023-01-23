// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:oma/Screens/Welcome.dart';
import './constant.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  bool firstOpen = true;
  _onIntroEnd(context) async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!firstOpen) {
        _onIntroEnd(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      descriptionPadding: EdgeInsets.all(16),
      // pageColor: Colors.blueGrey,
      imagePadding: EdgeInsets.zero,
    );

    return firstOpen
        ? Container(
            child: IntroductionScreen(
              globalBackgroundColor: Colors.blue,
              pages: [
                PageViewModel(
                  titleWidget: const Text(
                    "Welcome",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  bodyWidget: const Text(
                    "Thank you for choosing our application. We've put a lot of effort into making it user-friendly and efficient, and we're confident you'll enjoy it. Let's begin",
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 0.5,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  image: Container(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(22),
                    child: Image.asset(
                      "images/welcomeIcon.png",
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  decoration: const PageDecoration(
                      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                      fullScreen: true,
                      bodyFlex: 2,
                      imageFlex: 3),
                ),
                PageViewModel(
                  titleWidget: const Text(
                    "Health Monitoring",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  bodyWidget: const Text(
                    "Stay on top of your heart health with our mobile application's advanced heart rate and ECG monitoring feature",
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 0.5,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  image: Container(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(22),
                    child: Image.asset(
                      "images/ecgmonitoring.png",
                      fit: BoxFit.contain,
                      height: 340,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  decoration: const PageDecoration(
                      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                      fullScreen: true,
                      bodyFlex: 2,
                      imageFlex: 3),
                ),
                PageViewModel(
                  titleWidget: const Text(
                    "Location Services",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  bodyWidget: const Text(
                    "Our mobile application comes with a powerful location services feature that allows you to easily track and share your location with family.",
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 0.5,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  image: Container(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(22),
                    child: Image.asset(
                      "images/mobile-navigator.png",
                      fit: BoxFit.contain,
                      height: 340,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  decoration: const PageDecoration(
                      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                      fullScreen: true,
                      bodyFlex: 2,
                      imageFlex: 3),
                ),
                PageViewModel(
                  titleWidget: const Text(
                    "Emergency Call ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  bodyWidget: const Text(
                    "Our mobile application includes a dedicated emergency call feature, giving you one-touch access to emergency services in case of an emergency",
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 0.5,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  image: Container(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(22),
                    child: Image.asset(
                      "images/emgcall.png",
                      fit: BoxFit.contain,
                      height: 340,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  decoration: const PageDecoration(
                      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                      fullScreen: true,
                      bodyFlex: 2,
                      imageFlex: 3),
                ),
                PageViewModel(
                  titleWidget: const Text(
                    "Family Connection",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  bodyWidget: const Text(
                    "Our mobile application's family connection feature provides a secure and easy way for you to share your location and health information with your family members, giving them peace of mind and allowing them to stay informed about your well-being",
                    style: TextStyle(
                      color: Colors.white,
                      wordSpacing: 0.5,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  image: Container(
                    padding: EdgeInsets.symmetric(vertical: 50),
                    alignment: Alignment.topCenter,
                    margin: const EdgeInsets.all(22),
                    child: Image.asset(
                      "images/family.png",
                      fit: BoxFit.contain,
                      height: 340,
                      width: double.infinity,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  decoration: const PageDecoration(
                      contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                      fullScreen: true,
                      bodyFlex: 2,
                      imageFlex: 3),
                )
              ],
              onDone: () => _onIntroEnd(context),
              onSkip: () => _onIntroEnd(context),
              showSkipButton: true,
              skipFlex: 0,
              nextFlex: 0,

              skip: const Text(
                'Skip',
                style: TextStyle(color: Colors.white),
              ),
              next: const Icon(Icons.arrow_forward, color: Colors.white),
              done: const Text('Done',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white)),
              ///////////////
              controlsMargin: const EdgeInsets.all(16),
              controlsPadding: const EdgeInsets.all(4),
              dotsDecorator: const DotsDecorator(
                size: Size(10.0, 10.0),
                color: Colors.white,
                activeSize: Size(22.0, 10.0),
                activeColor: Colors.white,
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              dotsContainerDecorator: const ShapeDecoration(
                color: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
          )
        : WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
                body: SizedBox(
              height: size.height,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      "images/lo1.png",
                      width: size.width * 0.4,
                    ),
                  )
                ],
              ),
            )),
          );
  }
}
