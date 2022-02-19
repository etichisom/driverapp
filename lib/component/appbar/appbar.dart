
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget appbar(BuildContext context,String title,
    {Color color= apptheme,double
    size=18,FontWeight fontWeight =FontWeight.w500,bool center = true}){
  return AppBar(
    elevation: 0,
    centerTitle:center,
    backgroundColor:color,
    title: stext(title, size,fontWeight:fontWeight,color: Colors.white),
  );
}

Widget appbar1(BuildContext context,String title,
    {Color color=Colors.transparent,double size=18,FontWeight fontWeight =FontWeight.w500}){
  return AppBar(
    elevation: 0,
    leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
    centerTitle: true,
    backgroundColor:color,
    title: stext(title, 18,fontWeight:fontWeight,color: Colors.black),
  );
}