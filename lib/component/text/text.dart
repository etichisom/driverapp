import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget stext(String s,double size,{var color =Colors.black,FontWeight fontWeight = FontWeight.w400}){
  return Text(s.toString(),style: GoogleFonts.lato(fontSize:size,color:color,fontWeight: fontWeight),);
}