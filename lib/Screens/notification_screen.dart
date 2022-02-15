import 'package:bullet_pro/Models/noti.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/services/infoservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
Notim notim;
class NotificationScreen extends StatefulWidget {


  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    authbloc=Provider.of<Authbloc>(context);
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
      body:notim==null?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount:notim.data.length,
        itemBuilder: (context,index){
          var d = notim.data[index];
          return notificationWidget(d);
        },
      ),
    );
  }

  Widget notificationWidget(Data d) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      //height: screenHeight / 6,
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
                      fontSize: 12
                    ),
                  ),
                ),
                Text(
                  "4:30 PM",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: textColor,
                        fontSize: 12
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
              d.notificationDescription,
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 200),(){
      Infosettings().getnoti(authbloc.user.data.driverId)
          .then((value){
            setState(() {
              if(value!=null){
                notim=value;
              }
              notim=value;
            });
      });
    });
  }
}
