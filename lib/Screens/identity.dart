import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Identity extends StatefulWidget {


  @override
  _IdentityState createState() => _IdentityState();
}

class _IdentityState extends State<Identity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: identityCardWidget(context),
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
}
