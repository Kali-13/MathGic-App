import 'package:flutter/material.dart';
import 'package:mathgic/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme:
              TextTheme(bodyText1: TextStyle(), bodyText2: TextStyle()).apply(
            bodyColor: Colors.deepPurple,
          ),
          fontFamily: GoogleFonts.aBeeZee().fontFamily),
      home: AnimatedSplashScreen(
        splash: Image.asset("assets/images/Back_1.png"),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.scaleTransition,
        duration: 700,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
