import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RefrencesScreen extends StatefulWidget {


  @override
  _RefrencesScreenState createState() => _RefrencesScreenState();
}

class _RefrencesScreenState extends State<RefrencesScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
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
          "Refrences",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.all(Radius.circular(
                          100,
                        ))),
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    "Refrences",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          textFieldsWidget(),
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.all(Radius.circular(
                      100,
                    ))),
                child: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Text(
                "Refrences",
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
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
            vertical: 10,
          ),
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              labelText: "Refrence Person name*",
              hintText: "Name",
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
              labelText: "Relation*",
              hintText: " Name",
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
              labelText: "Mobile Number*",
              hintText: " Name",
              border: new OutlineInputBorder(
                borderSide: new BorderSide(
                  color: textColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: screenWidth / 2.5,
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 0,
              ),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "date*",
                  hintText: " Name",
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
              width: screenWidth / 2.4,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 0,
              ),
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Time*",
                  hintText: " Name",
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
      ],
    );
  }
}
