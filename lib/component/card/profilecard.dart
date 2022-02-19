import 'package:bullet/component/text/text.dart';
import 'package:bullet/theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profilecard extends StatelessWidget {
String title;
IconData iconData;
Function ontap;

Profilecard({this.title, this.iconData,this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap,
      child: Container(
        color: apptheme.maincolor.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Icon(iconData,color: apptheme.maincolor,),
              SizedBox(width: 20,),
              stext(title, 20,fontWeight: FontWeight.w500)
            ],
          ),
        ),
      ),
    );
  }
}

class Nextcard extends StatelessWidget {
  String title;
  Function ontap;

  Nextcard({this.title,this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap,
      child: Container(
        color: Colors.blue.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              SizedBox(width: 20,),
              stext(title, 20,fontWeight: FontWeight.w500),
              Spacer(),
              Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 18,),
            ],
          ),
        ),
      ),
    );
  }
}

