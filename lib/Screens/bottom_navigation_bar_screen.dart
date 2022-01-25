import 'package:bullet_pro/Screens/help_screen.dart';
import 'package:bullet_pro/Screens/main_screen.dart';
import 'package:bullet_pro/Screens/notification_screen.dart';
import 'package:bullet_pro/Screens/account_screen.dart';
import 'package:bullet_pro/Screens/user_chat_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';

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

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MainScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        focusColor: Colors.red,
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScreen()));
        },
        child: Icon(
          Icons.close,
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
                        currentScreen = UserChat();
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
}
