import 'package:bullet/theme/apptheme.dart';
import 'package:flutter/material.dart';

class Logbackground extends StatelessWidget {
  Widget child;
  Logbackground({this.child});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: apptheme.maincolor,
            height: size.height,
            width: size.width,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              height: size.height-270,
              width: size.width,
            ),
          ),
          Container(
            child: child,
            height: size.height,
            width: size.width,
          ),
        ],
      ),
    );
  }

}
