import 'package:bullet/component/text/text.dart';
import 'package:bullet/theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Button  extends StatelessWidget {
  String title;
  Function ontap;
  Color color;
  double radius;
  Color backgroundcolor;
  Button({this.title, this.ontap,
    this.color= Colors.white,this.radius=15,
  this.backgroundcolor=apptheme.maincolor});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color:backgroundcolor,
        onPressed: ontap,
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        child:stext(title, 16,color:color,fontWeight: FontWeight.w800));
  }
}
class Outbutton  extends StatelessWidget {
  String title;
  Function ontap;
  double radius;
  Outbutton({this.title, this.ontap,this.radius=15});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: apptheme.maincolor,width: 1),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        onPressed: ontap,
        child:stext(title, 16,color: Colors.black,fontWeight: FontWeight.w800));
  }
}



class ibutton  extends StatelessWidget {
  String title;
  Function ontap;
  Color color;
  double radius;
  IconData iconData;
  ibutton({this.title, this.ontap,this.color= Colors.blue,this.radius=15 ,this.iconData});

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
        color:apptheme.maincolor,
        onPressed: ontap,
        icon: Icon(iconData,color: Colors.white,),
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        label:stext(title, 16,color: Colors.white,fontWeight: FontWeight.w800));
  }
}

