import 'dart:convert';

import 'package:bullet_pro/Screens/profilescreen.dart';
import 'package:bullet_pro/Screens/verify_otp_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/services/infoservice.dart';
import 'package:bullet_pro/services/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PersonalDataScreen extends StatefulWidget {


  @override
  _PersonalDataScreenState createState() => _PersonalDataScreenState();
}

class _PersonalDataScreenState extends State<PersonalDataScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  var path;
  bool apicall =false;
  start(){setState(() {apicall=true;});}
  stop(){setState(() {apicall=false;});}
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    authbloc=Provider.of<Authbloc>(context);
    var value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: themeColor,
        title: Text(
          "Personal Data",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          //textFieldsWidget(),
          SizedBox(height:20 ,),
          uploadAndSaveWidget(),
        ],
      ),
    );
  }

  Widget textFieldsWidget() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              labelText: "First Name*",
              hintText: "Name",
              border: new OutlineInputBorder(
                borderSide: new BorderSide(
                  color: textColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 0,
          ),
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              labelText: "Last Name*",
              hintText: "Last Name",
              border: new OutlineInputBorder(
                borderSide: new BorderSide(
                  color: textColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget uploadAndSaveWidget() {
    var value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
          onTap: (){
            pickimage();
          },
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
            height: screenHeight / 16,
            width: screenWidth / 1.1,
            decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.all(Radius.circular(
                  10,
                ))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Radio(value:path==null?0:1,
                          groupValue:1,
                          onChanged: (v){}),
                      Text(
                        "Update New Photo",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 10,
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            right: 20,
          ),
          child: Text(
            "Full facial features must be clearly visible",
            style: TextStyle(
              color: textColor,
              fontSize: 12,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 20,
          ),
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  if(path!=null){
                    start();
                    Settings().updateprofile(authbloc.user.data.driverId,
                        path).then((value) {
                          stop();
                          Infosettings().Getdetail(authbloc.user.data.driverId).then((value){
                            setState(() {
                              driverd=value;
                            });
                          });
                    });
                  }

                },
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  height: screenHeight / 18,
                  width: screenWidth / 1.1,
                  decoration: const BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    child:apicall?progress():Text(
                      "Save",
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  void pickimage() async{
    var image =  await ImagePicker().pickImage(source: ImageSource.gallery);
    var p = await image.readAsBytes();
    path  = base64Encode(p);
    print(path);
    setState(() {});
  }
}
