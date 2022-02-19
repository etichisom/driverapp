import 'package:bullet_pro/Models/incomem.dart';
import 'package:bullet_pro/Screens/points_screen.dart';
import 'package:bullet_pro/Screens/profilescreen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/component/bookcard.dart';
import 'package:bullet_pro/services/infoservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'balance_screen.dart';
Incomem incomem;
class Stat extends StatefulWidget {

  @override
  _StatState createState() => _StatState();
}

class _StatState extends State<Stat> {
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    authbloc=Provider.of<Authbloc>(context);
    return Scaffold(
      body: incomem==null?Center(child: CircularProgressIndicator()):statistaicsWidget(context),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 200),(){
      Infosettings().getincom(authbloc.user.data.driverId).then((value){
        setState(() {
          incomem=value;
        });
      });
      Infosettings().getstat(authbloc.user.data.driverId)
          .then((value){
        setState(() {
          if(value!=null){
            statm=value;
            com=value.data.completeBooking.toString();
            cash=value.data.cashlessCollection.toString();
            cashvalue=value.data.totalBalance.toString();

          }
          //notim=value;
        });
      });
    });

  }
  Widget statistaicsWidget(BuildContext context) {
    double screenHeight = 0;
    double screenWidth = 0;
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    var data = incomem.data;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 10,),
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
                              com,
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
                              rupee+cash,
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
                          "₹${cashvalue}",
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
                      Text(rupee+ data.totalIncome,),
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
                      Text(rupee + data.weekIncome,),
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
                      Text(rupee+ data.monthIncome,),
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
      ),
    );
  }

}
