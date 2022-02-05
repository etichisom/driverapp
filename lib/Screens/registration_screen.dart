import 'dart:convert';

import 'package:bullet_pro/Screens/address_proof_screen.dart';
import 'package:bullet_pro/Screens/verify_otp_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/Utils/nav.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'login_screen.dart';

class RegistrationPage extends StatefulWidget {


  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  double screenHeight = 0;
  double screenWidth = 0;
  int index = 0;
  var path;
  List jobtype = ["full_time","part_time"];
  bool apicall =false;
  start(){setState(() {apicall=true;});}
  stop(){setState(() {apicall=false;});}
  TextEditingController phonenumber = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController photo = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    var _value;
    return Scaffold(
      body: Form(
        key: key,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/back2.jpg",
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  "Registration",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              regionTextFieldWidget(),
              fullNameTextFieldWidget(),
              photoTextFieldWidget(),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Text(
                  "Full facial features must be clearly visible",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Text(
                  "PREFERD EMPLOYMENT TYPE*",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              employmentTypeWidget(),
              buttonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget regionTextFieldWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            child: Text(
              "Phone",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            width: screenWidth / 1.1,
            child: Card(
              child: TextFormField(
                controller: phonenumber,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: "Contact",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),

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
          ),
        ],
      ),
    );
  }

  Widget fullNameTextFieldWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Text(
            "Full Name*",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              width: screenWidth / 2.3,
              child: Card(
                child: TextFormField(
                  validator: (e){
                    if(e.length<2){
                      return "Enter first name";
                    }else{
                      return null;
                    }
                  },
                  controller: fname,
                  decoration: InputDecoration(
                    hintText: "First Name",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: screenWidth / 2.3,
              child: Card(
                child: TextFormField(
                  controller: lname,
                  validator: (e){
                    if(e.length<2){
                      return "Enter last name";
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget photoTextFieldWidget() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            child: Text(
              "Photo*",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            width: screenWidth / 1.1,
            child: GestureDetector(
              onTap: (){
                pickimage();
              },
              child: Card(
                child: TextField(
                  enabled: false,
                  //controller: photo,
                  decoration: InputDecoration(
                    hintText: "Photo",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person_add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget employmentTypeWidget() {
    var _value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            left: 10,
          ),
          height: screenHeight / 6,
          width: screenWidth / 1.05,
          child: Card(
            child: Column(
              children: [
                ListTile(
                  leading: Radio<int>(
                    value:0,
                    groupValue:index ,
                    onChanged: (e){
                      setState(() {
                        index=e;
                      });
                    },
                  ),
                  title: Text(
                    "Fulltime employment(5/2)",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  minLeadingWidth: 0,
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  leading: Radio<int>(
                    value:1,
                    groupValue:index ,
                    onChanged: (e){
                      setState(() {
                        index=e;
                      });
                    },
                  ),
                  title: Text(
                    "Part-time employment(flexible hours)",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  minLeadingWidth: 0,
                ),
              ],
            ),
          ),
        ),
      ],
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
              reg();
            },
            child: Container(
              margin: const EdgeInsets.only(
                top: 30,
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
              child:apicall?progress():Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        right: 00,
                      ),
                      child: Text(
                        "Continue",
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
                        left: 50,
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

  void pickimage() async{
   var image =  await ImagePicker().pickImage(source: ImageSource.gallery);
      path = await image.readAsBytes();
      print(path);

  }

  void reg() {
    print('hdhdhd');
    if(key.currentState.validate()) {
      start();
      print('chhkkll');
      Authservice().createaccount(
        number:phonenumber.text.trim() ,
        name:fname.text.trim() ,
        type: jobtype[index],
        fname:fname.text.trim() ,
        lname:lname.text.trim() ,
      ).catchError((e){
        stop();
      }).then((value){
        print(value);
        stop();
        if(value==true){
          nav(VerifyOTP(), context);
        }
      });
    }else{
      print(key.currentState.validate());
    }

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
