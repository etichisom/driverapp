import 'dart:convert';

import 'package:bullet_pro/Screens/verify_otp_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/services/detailservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class TransportTypeScreen extends StatefulWidget {


  @override
  _TransportTypeScreenState createState() => _TransportTypeScreenState();
}

class _TransportTypeScreenState extends State<TransportTypeScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  var path;
  var path2;
  Authbloc authbloc;
  bool apicall =false;
  start(){setState(() {apicall=true;});}
  stop(){setState(() {apicall=false;});}
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    authbloc=Provider.of<Authbloc>(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
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
          "TransPort Type",
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
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  12,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.bike_scooter,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              "MotarBike(0-20kg.)",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
              ),
              Divider(
                color: textColor,
                indent: 2,
                height: 0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                height: 50,
                child: TextField(
                  controller: number,
                  decoration: InputDecoration(
                    labelText: "Driving License Number*",
                    hintText: "License Number",
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
          ),
          Column(
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
                            Radio(
                                value: path==null?false:true,
                                groupValue:true,
                                onChanged: value),
                            Text(
                              "Driver's License photo(front)",
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
              InkWell(
                onTap: (){
                  pickimage2();
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
                            Radio(
                                value: path2==null?false:true,
                                groupValue:true,
                                onChanged: value),
                            Text(
                              "Driver's License photo(Back)",
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
                  top: 20,
                ),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                       save();
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
                          child:apicall?progress(): Text(
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
          ),
        ],
      ),
    );
  }
  void pickimage() async{
    var image =  await ImagePicker().pickImage(source: ImageSource.gallery);
    var p = await image.readAsBytes();
    path  = base64Encode(p);
    print(path);
    setState(() {});

  }
  void pickimage2() async{
    var image =  await ImagePicker().pickImage(source: ImageSource.gallery);
    var p = await image.readAsBytes();
    path2  = base64Encode(p);
    print(path);
    setState(() {});

  }

  void save() {
    if(number.text.isEmpty||path==null||path2==null){
      EasyLoading.showToast('Enter License number and select image',toastPosition: EasyLoadingToastPosition.top);
    }else{
      start();
      Detailservices().uploaddl(path,path2, number.text, authbloc.user.data.driverId)
          .then((value){
        stop();
      });
    }
  }
}
