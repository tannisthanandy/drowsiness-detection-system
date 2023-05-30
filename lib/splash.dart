import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'dart:async';
import 'main.dart';
import 'package:databasedemo/firstpage.dart';


class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override



  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Firstpage(),
      duration: 6000,
      imageSize: 200,
      imageSrc: "images/splash.png",
      text: "DROWSINESS ALERTER",
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
          fontSize: 30.0,fontWeight: FontWeight.bold,
          color: Colors.white
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
