import 'package:bullet_pro/Screens/avialable_book.dart';
import 'package:bullet_pro/Screens/book/combook.dart';
import 'package:bullet_pro/Screens/profilescreen.dart';
import 'package:bullet_pro/Screens/verify_otp_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/bloc/bookbloc.dart';
import 'package:bullet_pro/services/infoservice.dart';
import 'package:bullet_pro/services/locationservices.dart';
import 'package:bullet_pro/theme/apptheme.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:provider/provider.dart';

import 'book/activebooking.dart';
import 'book/tollpick.dart';

class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  void stateChanged(bool isShow) {
    print('menu is ${ isShow ? 'showing': 'closed' }');
  }
  bool load  = false;
  start(){setState(() {load=true;});}
  stop(){setState(() {load=false;});}
  TabController _controller;
  double screenHeight = 0;
  double screenWidth = 0;
  Bookbloc bookbloc;
  Authbloc authbloc;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      //FirebaseMessaging.;
      FirebaseMessaging.onMessage.listen((event) {
        bookbloc.getactivebook(authbloc.user.data.driverId);
        bookbloc.getrecentbook(authbloc.user.data.driverId);
        print(event);
      });
      Infosettings().Getdetail(authbloc.user.data.driverId).
      then((value) {
        if(value!=null){
          setState(() {
            driverd=value;
          });
        }
      });
    });

  }

  TabBar _tabBar = TabBar(
      indicator: BoxDecoration(
        color: themeColor,
        borderRadius: BorderRadius.all(
          Radius.circular(
            100,
          ),
        ),
      ),
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  "Avialable",
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Icon(
                    Icons.calendar_today,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  "Active",
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.center,
            child: Row(
              children: [
                Text(
                  "Completed",
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    left: 5,
                  ),
                  child: Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),
          ),
        ),
      ]);
  @override
  Widget build(BuildContext context) {
    authbloc=Provider.of<Authbloc>(context);
    bookbloc = Provider.of<Bookbloc>(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
           driverd==null?SizedBox():PopupMenuButton(
              icon: Icon(Icons.online_prediction),
              offset: Offset(0, 50),
              shape:  TooltipShape(),
              onSelected: (v){
                print(v);
                Locationservices().updatestatus(authbloc.user.data.driverId, v)
                    .then((value){
                  Infosettings().Getdetail(authbloc.user.data.driverId).
                  then((value) {
                    if(value!=null){
                      setState(() {
                        driverd=value;
                      });
                    }
                  });
                });
              },
              itemBuilder: (_) => <PopupMenuEntry>[
                PopupMenuItem(
                  value: 'online',
                    child: ListTile(
                      leading: const Icon(Icons.work,color: Colors.green,),
                      title: const Text("I'm working"),
                    )),
                PopupMenuItem(
                  value: 'offline',
                    child: ListTile(
                      leading: const Icon(Icons.work_off,color: Colors.red,),
                      title: const Text("I'm not working"),
                    )),
              ],
            ),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: themeColor,
          title: Text("Orders"),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(),
                height: 35,
                margin: EdgeInsets.symmetric(
                  vertical: 3,
                ),
                width: screenWidth,
                child: _tabBar,
              ),
            ),
          ),
        ),
        body: TabBarView(children: [
         driverd==null?Availbe():driverd.data.driverLoginStatus.toString()=='0'?
          avialbleWidget():Availbe(),
          driverd==null?Activebooking():driverd.data.driverLoginStatus.toString()=='0'?
          avialbleWidget():Activebooking(),
          Combooking(),
        ]),
        // bottomNavigationBar: MyBottomNavigatonBar(),
      ),
    );
  }

  Widget avialbleWidget() {
    return ListView(
      children: [
        Container(
          alignment: Alignment.center,
          height: screenHeight / 1.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenHeight / 11,
                width: screenWidth / 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      100,
                    ),
                  ),
                ),
                child: Icon(
                  Icons.location_on_outlined,
                  color: themeColor,
                  size: 35,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: Text(
                  "You are away so you cannot see available order",
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RaisedButton(
                color:Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                onPressed:(){
                  if(load==false){
                    start();
                    Locationservices().updatestatus(authbloc.user.data.driverId, "online")
                        .then((value){
                      Infosettings().Getdetail(authbloc.user.data.driverId).
                      then((value) {
                        stop();
                        if(value!=null){
                          setState(() {
                            driverd=value;
                          });
                        }
                      });
                    });
                  }

              },
                child:load?SizedBox(
                  width: 20,
                    height: 20,
                    child: progress()):Text(
                  "Resume work",
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),),
            ],
          ),
        ),
      ],
    );
  }



  Widget completedWidget() {
    return ListView(
      children: [
        Container(
          height: screenHeight / 1.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60,
                child: Image.asset(
                  "assets/sad.png",
                  color: themeColor,
                ),
              ),
              Container(
                child: Text(
                  "                as of \n 11:04 AM 29 December \n   no orders Completed",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
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
}
