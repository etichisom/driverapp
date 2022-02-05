import 'package:bullet_pro/Models/driverd.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/Utils/nav.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/services/infoservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../login_screen.dart';
Driverd driverd;
class Profile extends StatefulWidget {


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double screenHeight = 0;
  double screenWidth = 0;
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    authbloc=Provider.of<Authbloc>(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: driverd==null?CircularProgressIndicator():profileWidget(context),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 200),(){
      Infosettings().Getdetail(authbloc.user.data.driverId).then((value){
        setState(() {
          driverd=value;
        });
      });
    });

  }
  Widget profileWidget(context) {
    var d = driverd.data;
    double screenHeight = 0;
    double screenWidth = 0;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Card(
                elevation: 10,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: screenWidth / 2,
                  height: screenHeight / 5,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: screenWidth / 5,
                          height: screenHeight / 11,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                100,
                              ),
                            ),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/profile.jpg",
                                // d.driverImage.toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 54.0,
                                  bottom: 60,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: themeColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Text(
                            d.driverFullName.toString(),
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "+91 ${d.driverMobile.toString()}",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 15,
                  ),
                  width: screenWidth / 2.3,
                  height: screenHeight / 8,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        height: screenHeight / 10,
                        child: Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: screenWidth,
                              height: screenHeight,
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Text(
                                    "Completed Orders",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "402",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                100,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.100,
                              )
                            ]),
                        child: Icon(
                          Icons.list_alt_outlined,
                          color: themeColor,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  width: screenWidth / 2.3,
                  height: screenHeight / 8,
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                        ),
                        height: screenHeight / 10,
                        child: Card(
                            elevation: 10,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              width: screenWidth,
                              height: screenHeight,
                              margin: EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Text(
                                    "Your Rating",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "4.2*",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 60),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                100,
                              ),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0.100,
                              )
                            ]),
                        child: Icon(
                          Icons.star,
                          color: themeColor,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 10,
                top: 30,
              ),
              child: Row(children: [
                Icon(
                  Icons.help,
                  color: Colors.red,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    "Late Orders:1 of last 5",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 5,
              ),
              child: Row(children: [
                Icon(
                  Icons.help,
                  color: Colors.red,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Text(
                    "Check AutoStart Settings to make sure will \n receive all notifications",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      nav(LoginScreen(), context,remove: true);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        vertical: 30,
                      ),
                      height: screenHeight / 14,
                      width: screenWidth / 1.1,
                      decoration: const BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                "Sign-Out",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        vertical: 0,
                      ),
                      height: screenHeight / 14,
                      width: screenWidth / 1.4,
                      decoration: const BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            15,
                          ),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(
                          right: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.group,
                              color: Colors.white,
                            ),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Text(
                                "Invite Friend",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
