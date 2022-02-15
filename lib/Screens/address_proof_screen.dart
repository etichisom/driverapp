import 'package:bullet_pro/Screens/bottom_navigation_bar_screen.dart';
import 'package:bullet_pro/Screens/main_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddressProof extends StatefulWidget {


  @override
  _AddressProofState createState() => _AddressProofState();
}

class _AddressProofState extends State<AddressProof> {
  bool isChecked = false;
  double screenHeight = 0;
  double screenWidth = 0;
  var path;
  var path2;
  Authbloc authbloc;
  bool apicall =false;
  start(){setState(() {apicall=true;});}
  stop(){setState(() {apicall=false;});}
  TextEditingController number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    authbloc=Provider.of<Authbloc>(context);
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return themeColor;
    }

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    var _value;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/back2.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Registration',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 30,
                bottom: 10,
              ),
              child: Text(
                "PROOF OF ADDRESS(POA)",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            proofOfAddressWidget(),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 40,
              ),
              child: Text(
                "PAN CARD",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            pancardWidget(),
            Container(
              margin: const EdgeInsets.only(
                left: 20,
                top: 40,
              ),
              child: Text(
                "PROMO CODE",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            promoCodeWidget(),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30,
              ),
              child: Text(
                "Promo code from a friend who invited you to join",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 40,
                    top: 40,
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool value) {
                          setState(() {
                            isChecked = value;
                          });
                        },
                      ),
                      Text("I agree to the"),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: Text(
                          "Terms",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Text("and"),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),
                        child: Text(
                          "Privacy Policy",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            buttonWidget(),
          ],
        ),
      ),
    );
  }

  Widget proofOfAddressWidget() {
    var _value;
    return Column(
      children: [
        Container(
          height: screenHeight / 6,
          width: screenWidth / 1.1,
          child: Card(
            shadowColor: themeColor,
            child: Column(
              children: [
                ListTile(
                  leading: Radio(
                    value: () {},
                    groupValue: _value,
                    onChanged: _value,
                    activeColor: themeColor,
                  ),
                  title: Text(
                    "Aadhar Card Front side/Driving License/\nPassport",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.person_add,
                    ),
                    onPressed: () {},
                  ),
                  minLeadingWidth: 0,
                ),
                Divider(),
                ListTile(
                  leading: Radio(
                    value: () {},
                    groupValue: _value,
                    onChanged: _value,
                    activeColor: themeColor,
                  ),
                  title: Text(
                    "Aadhar Card Back side/Driving License/\nPassport",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.person_add,
                    ),
                    onPressed: () {},
                  ),
                  minLeadingWidth: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget pancardWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          width: screenWidth / 1.1,
          child: Card(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Pan Card",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget promoCodeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          width: screenWidth / 1.1,
          child: Card(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Promo Code",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buttonWidget() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>MyBottomNavigatonBar(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                  // top: 30,
                  ),
              height: screenHeight / 14,
              width: screenWidth / 1.4,
              decoration: const BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    35,
                  ),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        right: 00,
                      ),
                      child: Text(
                        "Sign-Up",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        left: 60,
                      ),
                      height: screenHeight / 16,
                      width: screenWidth / 8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            100,
                          ),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: textColor,
                          size: 18,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
