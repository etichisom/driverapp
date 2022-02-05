import 'package:bullet_pro/Models/settingsModel.dart';
import 'package:bullet_pro/Screens/address_proof.dart';
import 'package:bullet_pro/Screens/address_proof_screen.dart';
import 'package:bullet_pro/Screens/balance_screen.dart';
import 'package:bullet_pro/Screens/bank_details_screen.dart';
import 'package:bullet_pro/Screens/change_region_screen.dart';
import 'package:bullet_pro/Screens/email_screen.dart';
import 'package:bullet_pro/Screens/login_screen.dart';
import 'package:bullet_pro/Screens/navigator_screen.dart';
import 'package:bullet_pro/Screens/pan_card_screen.dart';
import 'package:bullet_pro/Screens/personal_data_screen.dart';
import 'package:bullet_pro/Screens/points_screen.dart';
import 'package:bullet_pro/Screens/refrences_screen.dart';
import 'package:bullet_pro/Screens/transport_type_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'book/profilescreen.dart';
import 'identity.dart';

class AccountScreen extends StatefulWidget {


  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  List<SettingsModel> settings = [
    SettingsModel(
      title: "Personal Data",
      icon: Icons.menu_book,
      action: PersonalDataScreen(),
    ),
    SettingsModel(
      title: "PAN Card",
      icon: Icons.menu_book,
      action: PanCardScreen(),
    ),
    SettingsModel(
      title: "Address Proof (AP)",
      icon: Icons.menu_book,
      action: APScreen(),
    ),
    SettingsModel(
      title: "Transport Type",
      icon: Icons.car_rental_sharp,
      action: TransportTypeScreen(),
    ),
    SettingsModel(
      title: "Refrences",
      icon: Icons.star,
      action: RefrencesScreen(),
    ),
    SettingsModel(
      title: "E-mail",
      icon: Icons.email,
      action: EmailScreen(),
    ),
    SettingsModel(
      title: "Bank Detial",
      icon: Icons.menu_book,
      action: BankDetailsScreen(),
    ),
    SettingsModel(
      title: "Change Region",
      icon: Icons.face_retouching_natural_outlined,
      action: ChangeRegionScreen(),
    ),
  ];

  TabController _controller;

  double screenHeight = 0;
  double screenWidth = 0;
  @override
  void initState() {
    _controller = TabController(length: 6, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  TabBar _tabBar = TabBar(
      isScrollable: true,
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
            child: Text(
              "YOU TODAY",
            ),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "PROFILE",
            ),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "IDENTITY CARD",
            ),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "SETTINGS",
            ),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "STATACTICS",
            ),
          ),
        ),
        Tab(
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "PROMO CODE",
            ),
          ),
        ),
      ]);
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: themeColor,
          title: Text("Account"),
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(),
                  height: 30,
                  margin: EdgeInsets.symmetric(
                    vertical: 3,
                  ),
                  width: screenWidth,
                  child: _tabBar,
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // -------------YouToday Widget --------------------------------
            youTodayWidget(context),

            // -------------Profile Widget --------------------------------
            Profile(),

            // -------------Identity  Widget --------------------------------
            Identity(),

            // -------------Settings Widget --------------------------------

            ListView(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NavigatorScreen()));
                  },
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              margin: const EdgeInsets.only(
                                left: 20,
                                top: 20,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: screenHeight / 17,
                                    width: screenWidth / 8,
                                    decoration: BoxDecoration(
                                      color: Color(0xffbFFF59F),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          10,
                                        ),
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.assistant_navigation,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: Text(
                                      "Navigator",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                right: 15,
                                top: 20,
                              ),
                              alignment: Alignment.center,
                              height: screenHeight / 26,
                              width: screenWidth / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      10,
                                    ),
                                  ),
                                  border: Border.all(
                                    color: themeColor,
                                    width: 2,
                                  )),
                              child: Text(
                                "Google",
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: textColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: screenWidth / 1.1,
                      child: Divider(
                        color: textColor,
                        indent: 2,
                        // height: 0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight / 1.5,
                  width: screenWidth,
                  child: ListView.builder(
                    // scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    // reverse: false,
                    shrinkWrap: true,
                    itemCount: settings.length,

                    itemBuilder: (context, index) => settingsWidget(
                      settings[index],
                    ),
                  ),
                ),
              ],
            ),

            // -------------Static Widget --------------------------------

            ListView(
              children: [
                statistaicsWidget(),
              ],
            ),
            // -------------PromoCode Widget --------------------------------

            ListView(
              children: [
                promocodeWidget(),
              ],
            ),
          ],
        ),
      ),
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
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    height: screenHeight / 5,
                    child: Image.asset("assets/me.jpg"),
                  ),
                  Text(
                    "Photo of you today",
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



  Widget identityCardWidget(context) {
    TextEditingController _nameController = TextEditingController();
    FocusNode _nameNode = FocusNode();
    double screenHeight = 0;
    double screenWidth = 0;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                "Delivery of Essential Goods",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              height: screenHeight / 8,
              child: Image.asset("assets/Group 1306.png"),
            ),
            // CustomTextField(
            //   controller: _nameController,
            //   focusNode: _nameNode,
            //   nextFocus: _nameNode,
            //   onSubmit: () {},
            //   onChanged: () {},
            // )
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Name*",
                  hintText: "Your Name",
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
              ),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Id*",
                  hintText: "Your ID",
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
                vertical: 10,
              ),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "City*",
                  hintText: "City",
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
              ),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Corier's mobile no*",
                  hintText: "XXXXXXX",
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
                vertical: 10,
              ),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Bullet Mobile Number*",
                  hintText: "XXXXXXX",
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
              ),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Bullet e-email*",
                  hintText: "XXXXXXX",
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
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                top: 10,
              ),
              height: screenHeight / 15,
              width: screenWidth / 1.2,
              decoration: BoxDecoration(
                color: Colors.green.shade200,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    15,
                  ),
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ID  Card",
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Icon(
                              Icons.share,
                              color: textColor,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Icon(
                              Icons.download,
                              color: textColor,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Icon(
                              Icons.qr_code_scanner_sharp,
                              color: textColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget settingsWidget(SettingsModel item) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => item.action));
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: screenHeight / 17,
                        width: screenWidth / 8,
                        decoration: BoxDecoration(
                          color: Color(0xffbFFF59F),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        child: Icon(
                          item.icon,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: screenWidth / 1.1,
          child: Divider(
            color: textColor,
            indent: 2,
            height: 0,
          ),
        ),
      ],
    );
  }

  Widget statistaicsWidget() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: screenHeight / 13,
                    width: screenWidth / 6,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/profile.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          100,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 45,
                      left: 8,
                    ),
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(
                          25,
                        ))),
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "4.9",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          Icon(
                            Icons.star,
                            size: 13,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "Rohit Bain",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Text("Your rating",
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: screenHeight / 6.5,
          width: screenWidth / 1.1,
          decoration: BoxDecoration(
            color: Color(0xffbE3FFC8),
            borderRadius: BorderRadius.all(
              Radius.circular(
                15,
              ),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of order completed:",
                          ),
                          Text(
                            "00.00",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cash:",
                          ),
                          Text(
                            "00.00",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cash Value:",
                          ),
                          Text(
                            "00.00",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight / 18,
                width: screenWidth,
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      15,
                    ),
                    bottomRight: Radius.circular(
                      15,
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Balance",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "₹00.00",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: screenHeight / 18,
                width: screenWidth / 3,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: themeColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(
                    15,
                  )),
                ),
                child: Text(
                  "Pay at Bullet",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BalanceScreen()));
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    // vertical: 10
                  ),
                  alignment: Alignment.center,
                  height: screenHeight / 18,
                  width: screenWidth / 4,
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.all(Radius.circular(
                      15,
                    )),
                  ),
                  child: Text(
                    "Show",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            // horizontal: 10,
            vertical: 10,
          ),
          height: screenHeight / 18,
          width: screenWidth / 1.1,
          color: themeColor,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Points",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "₹00.00 from bullet",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PointsScreen()));
          },
          child: Container(
            alignment: Alignment.center,
            height: screenHeight / 18,
            width: screenWidth / 1.1,
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
            child: Text(
              "Show",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            "My Income",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: screenHeight / 10,
          width: screenWidth / 1.1,
          decoration: BoxDecoration(
            color: Color(0xffbE3FFC8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total:"),
                    Text("₹00.00"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("In the last 7 Days:"),
                    Text("₹00.00"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("In the last 30 Days:"),
                    Text("₹00.00"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            "Monthly Statistacis",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          height: screenHeight / 18,
          width: screenWidth / 1.1,
          decoration: BoxDecoration(
            color: Color(0xffbE3FFC8),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Month"),
                  Text("Earnings"),
                  Text("Orders count"),
                ],
              )),
        ),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            "2021",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            // horizontal: 10,
            vertical: 10,
          ),
          height: screenHeight / 18,
          width: screenWidth / 1.1,
          color: themeColor,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "December",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "₹00.00 ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  "₹00.00 ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget promocodeWidget() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          height: screenHeight / 6,
          width: screenWidth / 1.1,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 0.01,
                  offset: Offset.zero,
                )
              ]),
          child: Column(
            children: [
              Container(
                height: screenHeight / 18,
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "2ZDC6B",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: screenHeight / 22,
                        width: screenWidth / 4,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(
                            15,
                          )),
                        ),
                        child: Text(
                          "Copy",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Text(
                  "Get 100 Bonus Points",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  // vertical: 10,
                ),
                child: Text(
                    "The Indian rupee sign (₹) is the currency symbol for the Indian rupee, the official currency of India. Designed by Udaya Kumar, "),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Divider(
            color: Colors.grey.shade300,
            thickness: 20,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          height: screenHeight / 4.5,
          width: screenWidth / 1.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 0.100)]),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Got Promo Code?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Promo Code*",
                    hintText: "Code",
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
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressProof(),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        height: screenHeight / 20,
                        width: screenWidth / 2,
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
                          child: Text(
                            "Activate",
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
        ),
      ],
    );
  }
}
