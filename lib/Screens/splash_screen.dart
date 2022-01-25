// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bullet_pro/Screens/welcome_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenHeight / 2,
            width: screenWidth,
            child: Image.asset("assets/Motorbike-1.png"),
          ),
          Text(
            "We Deliverd Your Trust",
            style: GoogleFonts.frankRuhlLibre(
              textStyle: const TextStyle(
                fontSize: 15,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: screenHeight / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: screenHeight / 15,
                  width: screenWidth / 6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/indianFlag.png",
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    "We are Indian",
                    style: GoogleFonts.greatVibes(
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WelcomeScreen(),
        ),
      );
    });

    super.initState();
  }
}
