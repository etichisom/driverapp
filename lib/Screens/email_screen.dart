import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailScreen extends StatefulWidget {


  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    var value;
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
          "E-mail",
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
                margin: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  12,
                                ),
                              ),
                            ),
                            child: Icon(
                              Icons.mail,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Text(
                              "E-Mail",
                            ),
                          ),
                        ],
                      ),
                    ),
                    Radio(value: () {}, groupValue: () {}, onChanged: value)
                  ],
                ),
              ),
              Divider(
                color: textColor,
                indent: 2,
                height: 0,
              ),
              Text(
                "We will send checks,invoices and other important doucument \n                                            to the post office",
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
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
