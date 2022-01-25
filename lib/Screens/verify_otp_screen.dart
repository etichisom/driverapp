// ignore_for_file: deprecated_member_use

import 'package:bullet_pro/Screens/bottom_navigation_bar_screen.dart';
import 'package:bullet_pro/Screens/main_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:provider/provider.dart';

class VerifyOTP extends StatefulWidget {


  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool apicall =false;
  TextEditingController pin = TextEditingController();
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    authbloc = Provider.of<Authbloc>(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/back3.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                logoWidget(),
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    left: 20,
                  ),
                  child: Text(
                    "Verify Your Phone number",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 20,
                  ),
                  child: Text(
                    "Please enter the verification code send \nto your mobile number ?",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                darkRoundedPinPut(),
                buttonWidget(),
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not Recived",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text(
                          "Resend OTP",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget logoWidget() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      height: screenHeight / 4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/Group-17345.png",
          ),
        ),
      ),
    );
  }

  Widget darkRoundedPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.grey.shade400,
      borderRadius: BorderRadius.circular(100.0),
    );
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: PinPut(
          withCursor: true,
          fieldsCount: 6,
          controller: pin,
          eachFieldMargin: EdgeInsets.symmetric(horizontal: 0),
          submittedFieldDecoration: pinPutDecoration,
          selectedFieldDecoration: BoxDecoration(
            color: themeColor,
            borderRadius: BorderRadius.all(
              Radius.circular(
                1,
              ),
            ),
          ),
          followingFieldDecoration: pinPutDecoration,
          pinAnimationType: PinAnimationType.scale,
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            height: 1,
          ),
        ),
      ),
    );
  }

  Widget buttonWidget() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              if(apicall==false){
                if(pin.text.length>5){
                  start();
                  authbloc.login(
                      pin.text.trim()
                  ).then((value){
                    stop();
                    if(value!=null){
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => MyBottomNavigatonBar(),),
                              (route) => false);
                    }
                  }).catchError((e){
                    stop();
                  });
                }
              }

              //Navigator.push(context, MaterialPageRoute(builder: (context) => MyBottomNavigatonBar(),));
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              height: screenHeight / 14,
              width: screenWidth / 1.4,
              decoration: const BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    35,
                  ),
                ),
              ),
              child:apicall?progress(): Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        right: 00,
                      ),
                      child: Text(
                        "Verify",
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
                        left: 60,
                      ),
                      height: screenHeight / 16,
                      width: screenWidth / 8,
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
  start(){setState(() {apicall=true;});}
  stop(){setState(() {apicall=false;});}


}
Widget progress() {
  return Center(child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    strokeWidth: 5,
  ));
}