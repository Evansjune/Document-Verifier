import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'login.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {

    final pageList = [
      PageModel(
          color: const Color(0xFF678FB4),
          heroImagePath: 'images/document.png',
          title: const Text('Document Verifier',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontSize: 34.0,
              )),
          body: const Text('Verify a document instantly',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              )),
          iconImagePath: 'images/arrow-1.png'),
      PageModel(
          color: const Color(0xFF65B0B4),
          heroImagePath: 'images/cam.png',
          title: const Text('Upload Document',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.white,
                fontSize: 34.0,
              )),
          body: const Text(
              'Take a picture with camera or pick from Gallery',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              )),
          iconImagePath: 'images/arrow-1.png'),

      PageModel(
        color: const Color(0xFF9B90BC),
        heroImagePath: 'images/phone-1.png',
        title: const Text('Results',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 34.0,
            )),
        body: const Text('View the result displayed on the screen',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
        iconImagePath: 'assets/svg/cart.svg',
      ),
    ];

    return Scaffold(
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        onDoneButtonPressed: () =>
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                (context)=> Login()), (Route<dynamic> route) => false),
        onSkipButtonPressed: () =>
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:
                (context)=> Login()), (Route<dynamic> route) => false)
      ),
    );
  }
}