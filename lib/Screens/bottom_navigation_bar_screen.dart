
import 'package:bullet_pro/Screens/help_screen.dart';
import 'package:bullet_pro/Screens/main_screen.dart';
import 'package:bullet_pro/Screens/notification_screen.dart';
import 'package:bullet_pro/Screens/account_screen.dart';
import 'package:bullet_pro/Screens/profilescreen.dart';
import 'package:bullet_pro/Screens/user_chat_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/bloc/bookbloc.dart';
import 'package:bullet_pro/services/infoservice.dart';
import 'package:bullet_pro/services/locationservices.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import 'chat/messageus.dart';
Position position = Position(longitude:23123213123 , latitude:3131313213 ,
accuracy:1 ,altitude:1 ,speed:1,speedAccuracy:1 ,heading:1 ,timestamp:DateTime.now()  );
class MyBottomNavigatonBar extends StatefulWidget {


  @override
  _MyBottomNavigatonBarState createState() => _MyBottomNavigatonBarState();
}

class _MyBottomNavigatonBarState extends State<MyBottomNavigatonBar> {
  int currentTab = 5;
  final List<Widget> screens = [
    UserChat(),
    Container(
      child: Text("data"),
    ),
    Container(
      child: Text("data"),
    ),
    Container(
      child: Text("data"),
    ),
  ];
  Bookbloc bookbloc;
  Authbloc authbloc;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MainScreen();
  @override
  Widget build(BuildContext context) {
    authbloc=Provider.of<Authbloc>(context);
    bookbloc = Provider.of<Bookbloc>(context);
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: authbloc.driverd==null?Colors.green:authbloc.driverd.data.driverLoginStatus=="0"?Colors.green:Colors.green,
        backgroundColor: authbloc.driverd==null?Colors.red:authbloc.driverd.data.driverLoginStatus=="0"?Colors.red:Colors.green,
        onPressed: () {
          //intitnoti();
          if(currentTab==7){
            print(authbloc.driverd.data.driverLoginStatus);
            var c= 'online';
            if(authbloc.driverd.data.driverLoginStatus=="1"){
              c='offline';
            }
            Locationservices().updatestatus(authbloc.user.data.driverId, c)
                .then((value){
              Infosettings().Getdetail(authbloc.user.data.driverId).
              then((value) {
                if(value!=null){
                  print(c);
                  print(value.data.driverLoginStatus);
                  setState(() {
                    driverd=value;
                    authbloc.setd(value);
                  });
                }
              });
            });
          }
          setState(() {
            currentScreen = MainScreen();0
            currentTab = 7;
          });
         // Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
        },
        child: Icon(
          driverd==null?Icons.close:driverd.data.driverLoginStatus=="0"?Icons.close:Icons.check,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = Messegus();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.message,
                            color: currentTab == 1 ? themeColor : Colors.grey),
                        Text(
                          "Chat",
                          style: TextStyle(
                              color:
                                  currentTab == 1 ? themeColor : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = HelpScreen();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.help,
                            color: currentTab == 2 ? themeColor : Colors.grey),
                        Text(
                          "Help",
                          style: TextStyle(
                              color:
                                  currentTab == 2 ? themeColor : Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        // left: 20,
                        ),
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = NotificationScreen();
                          currentTab = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.notifications,
                              color:
                                  currentTab == 3 ? themeColor : Colors.grey),
                          Text(
                            "Notification",
                            style: TextStyle(
                              color: currentTab == 3 ? themeColor : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = AccountScreen();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 4 ? themeColor : Colors.grey,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: currentTab == 4 ? themeColor : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   locate();
   intitnoti();
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
            authbloc.setd(value);
          });
        }
      });
    });

  }

  void locate() async{
    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    Geolocator.getPositionStream().listen((event) {
      position=event;
      print(event.latitude);
    });
  }

  void intitnoti() {
    print('bjb');
   // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((event) {
      //_firebaseMessagingBackgroundHandler(event);

    });
  }
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background messagesss: ${message.messageId}");
    //AwesomeNotifications().createNotificationFromJsonData(message.data);

  }
}
