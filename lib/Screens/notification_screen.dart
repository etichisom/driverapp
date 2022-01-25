import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreen extends StatefulWidget {


  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          notificationWidget(),
        ],
      ),
    );
  }

  Widget notificationWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: screenHeight / 6,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 0.100,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 3,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "6 Decmeber 2021",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
                Text(
                  "4:30 PM",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 3,
            ),
            child: Text(
              "Read English Short Stories. Find what you are Looking for in 1 Minute or Less! Unlimited Access. 100% Secure. Always Facts. Privacy Friendly. The Best Resources. Results & Answers. Services: Best Results, Explore Now, New Sources, Best in Search.",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
