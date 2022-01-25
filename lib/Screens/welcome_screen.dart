import 'package:bullet_pro/Screens/login_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/Utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/back1.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 50,
                  ),
                  child: Text(
                    "Welcome to Bullet\n         driver !",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                  ),
                  height: screenHeight / 3,
                  width: screenWidth / 1.02,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/Food-Consumer-1.png",
                      ),
                    ),
                  ),
                ),
                buttonWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 60,
      ),
      height: screenHeight / 2.8,
      width: screenWidth / 1.6,
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
             nav(LoginScreen(), context);
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              height: screenHeight / 14,
              width: screenWidth / 1.2,
              decoration: const BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    100,
                  ),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        right: 00,
                      ),
                      child: Text(
                        "Get-Started",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        left: 30,
                      ),
                      height: screenHeight / 20,
                      width: screenWidth / 10,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            100,
                          ),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: textColor,
                          size: 18,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
