import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BankDetailsScreen extends StatefulWidget {


  @override
  _BankDetailsScreenState createState() => _BankDetailsScreenState();
}

class _BankDetailsScreenState extends State<BankDetailsScreen> {
  @override
  double screenHeight = 0;
  double screenWidth = 0;
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: themeColor,
        title: Text(
          "Personal Data",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          textFieldsWidget(),
          Container(
            margin: EdgeInsets.only(
              top: 20,
            ),
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const AddressProof(),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                    height: screenHeight / 18,
                    width: screenWidth / 1.1,
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
                        "Save",
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
    );
  }

  Widget textFieldsWidget() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              labelText: "IFSC code*",
              hintText: "XXXXX",
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
            vertical: 0,
          ),
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              labelText: "Bank account number*",
              hintText: "5613218*******",
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
    );
  }
}
