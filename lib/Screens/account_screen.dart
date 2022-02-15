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
import 'package:bullet_pro/Screens/stat.dart';
import 'package:bullet_pro/Screens/todayphoto.dart';
import 'package:bullet_pro/Screens/transport_type_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profilescreen.dart';
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
            Todayphoto(),

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


                Stat(),


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
