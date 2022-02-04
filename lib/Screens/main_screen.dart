import 'package:bullet_pro/Screens/avialable_book.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import 'book/activebooking.dart';

class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  TabController _controller;

  double screenHeight = 0;
  double screenWidth = 0;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    // TODO: implement initState
    super.initState();
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
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
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
          Availbe(),
          Activebooking(),
          completedWidget(),
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
                  "3 Orders avialable",
                  style: GoogleFonts.roboto(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget activeWidget() {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              height: screenHeight / 3.5,
              width: screenWidth / 1.03,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    7,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 0.100,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenHeight / 20,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            7,
                          ),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 0.100,
                          )
                        ]),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "₹567",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.list_alt_rounded,
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: screenHeight / 28,
                            width: screenWidth / 5,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  25,
                                ),
                              ),
                            ),
                            child: Text(
                              "#6565856",
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: Text(
                      "Parcel is on the way",
                      style: GoogleFonts.roboto(
                        color: textColor,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20,
                    ),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle,
                              color: textColor,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                              width: MediaQuery.of(context).size.width - 100,
                              child: const Text(
                                "A-56 Sector 63 Rd, A Block, Sector 65, Noida, Uttar Pradesh 239867, India.",
                                style: TextStyle(
                                  fontFamily: "SEGOEUI",
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 20,
                          color: Colors.grey,
                          width: 2,
                          margin: const EdgeInsets.only(
                            left: 24,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.circle_outlined,
                              color: textColor,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                              ),
                              width: MediaQuery.of(context).size.width - 100,
                              child: const Text(
                                "A-56 Sector 63 Rd, A Block, Sector 65, Noida, Uttar Pradesh 239867, India.",
                                style: TextStyle(
                                  fontFamily: "SEGOEUI",
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    alignment: Alignment.bottomRight,
                    width: screenWidth,
                    child: Text(
                      "Arrive  from 1:26 PM  to 2:30 PM",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: textColor,
                          fontSize: 12,
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
