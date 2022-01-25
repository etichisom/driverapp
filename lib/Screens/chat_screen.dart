import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatScreen extends StatefulWidget {


  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: screenHeight / 4,
            color: themeColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        "Bullet India Parcel",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Delivery Help Center',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                  ),
                  height: screenHeight / 7,
                  width: screenWidth / 1.2,
                  decoration: BoxDecoration(
                    // boxShadow: [BoxShadow(
                    //   blurRadius: 0.100,
                    // )],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: profileContainer()),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: profileContainer()),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: profileContainer()),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Text(
                            "Typically Replies in Under 20 min",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
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

  Widget profileContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: screenHeight / 17,
          width: screenWidth / 8,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Z2lybCUyMGZhY2V8ZW58MHx8MHx8&w=1000&q=80",
              ),
              fit: BoxFit.cover,
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.all(
              Radius.circular(
                100,
              ),
            ),
          ),
        ),
        Text(
          "Simran",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: textColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
