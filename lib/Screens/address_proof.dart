import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class APScreen extends StatefulWidget {


  @override
  _APScreenState createState() => _APScreenState();
}

class _APScreenState extends State<APScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    var _value;
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
          "Address Proof (AP)",
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
          Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Address*",
                    hintText: "Address",
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
                            Icons.camera_alt,
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
                            Icons.camera_alt,
                          ),
                          onPressed: () {},
                        ),
                        minLeadingWidth: 0,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "All four Corners of the documnent must be clearly visible",
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                ),
              ),
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
        ],
      ),
    );
  }
}
