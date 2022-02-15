import 'dart:convert';

import 'package:bullet_pro/Models/photoday.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/services/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
Photoday photoday;
class Todayphoto extends StatefulWidget {

  @override
  _TodayphotoState createState() => _TodayphotoState();
}

class _TodayphotoState extends State<Todayphoto> {
  Authbloc authbloc;
  var path;
  @override
  Widget build(BuildContext context) {
    authbloc=Provider.of<Authbloc>(context);
    return Scaffold(
      body: youTodayWidget(context),
    );
  }
  Widget youTodayWidget(context) {
    double screenHeight = 0;
    double screenWidth = 0;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    var _value;
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
              ),
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
                      vertical: 10,
                      horizontal: 10,
                    ),
                    child: Text(
                      "Read English Short Stories. Find what you are Looking for in 1 Minute or Less! Unlimited Access. 100% Secure. Always Facts. Privacy Friendly. The Best Resources. Results & Answers. Services: Best Results, Explore Now, New Sources, Best in Search.",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: Radio(
                        activeColor: Colors.red,
                        fillColor: _value,
                        value: 0,
                        groupValue: ValueKey,
                        onChanged: _value,
                      ),
                      title: Text(
                        "A full-length photo is required",
                        style: GoogleFonts.roboto(
                          color: Colors.red,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      minLeadingWidth: 0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight / 1.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      pick();
                    },
                    child: photoday==null?
                        Container(
                          height:100 ,
                          width: 100,
                          color: Colors.grey,
                        )
                        :Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                        height: screenHeight / 5,
                        child: Image.network(photoday.data.photoPath),
                    ),
                  ),
                  Text(
                    photoday==null?"Upload Photo":"Photo of you today",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 200),(){
      set();

    });
  }

  void pick()async {
    var image =  await ImagePicker().pickImage(source: ImageSource.camera);
    var p = await image.readAsBytes();
    path  = base64Encode(p);
    Settings().uploadphoto(authbloc.user.data.driverId, path).
    then((value) {
      set();
    });
  }

  void set() {
    Settings().getphoto(authbloc.user.data.driverId).then((value){
      setState(() {
        if(value!=null){
          photoday=value;
        }
      });
    });
  }

}
