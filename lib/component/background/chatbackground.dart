import 'package:flutter/material.dart';

class Chatbackground extends StatelessWidget {
  Widget child;
  Chatbackground({this.child});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.lightBlueAccent,
            height: size.height,
            width: size.width,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.white,
              height: size.height-320,
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
