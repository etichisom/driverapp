import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

nav(Widget child,BuildContext context,{remove=false}){
  if(remove){
    Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder:(context)=>child),
    (route) => false);
  }else{
    Navigator.push(context,MaterialPageRoute(builder:(context)=>child));
  }
}