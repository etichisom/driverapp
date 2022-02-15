import 'package:bullet_pro/Screens/create_new_password_screen.dart';
import 'package:bullet_pro/Screens/registration_screen.dart';
import 'package:bullet_pro/Screens/verify_otp_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
var ktoken ='';
class LoginScreen extends StatefulWidget {


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool apicall =false;
  start(){setState(() {apicall=true;});}
  stop(){setState(() {apicall=false;});}
  TextEditingController phonenumber = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: screenHeight / 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/loginback.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: ListView(
              children: [

                logoWidget(),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    left: 10,
                  ),
                  child: Text(
                    "Sign-In",
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                textFieldsWidget(),
                buttonWidget(),
                Column(
                  children: [
                    Container(
                      width: screenWidth / 1.2,
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateNewPassword(),
                            ),
                          );
                        },
                        child: Text(
                          "Forget Password?",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                registerNowWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logoWidget() {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      alignment: Alignment.center,
      height: screenHeight / 3.5,
      width: screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/Group 1306.png",
          ),
          // fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget textFieldsWidget() {
    return Form(
      key: key,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            width: screenWidth / 1.08,
            child: TextFormField(
              controller: phonenumber,
              keyboardType:TextInputType.phone,
              decoration: InputDecoration(
                labelText: "Phone Number",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                hintText: "7501XXXXX",
              ),
              validator: (e){
                if(e.length<10){
                  return "Enter mobile number";
                }else{
                  return null;
                }
              },
            ),
          ),

        ],
      ),
    );
  }

  Widget buttonWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 60,
      ),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              if(apicall==false){
                if(key.currentState.validate()){
                  start();
                  Authservice().Login(
                    context,
                      number: phonenumber.text
                  ).then((value){
                    stop();
                    if(value==true){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOTP(),),);
                    }
                  }).catchError((e){
                    stop();
                  });
                }
              }

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
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        right: 00,
                      ),
                      child: Text(
                        "Sign-In",
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

  Widget registerNowWidget() {
    return Container(
      height: screenHeight / 8,
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "New User?",
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  RegistrationPage(),
                ),
              );
            },
            child: Text(
              "Registration Now",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getToken().then((value){
      if(value!=null){
        ktoken=value;
        print(value);
      }
    });
  }
}
