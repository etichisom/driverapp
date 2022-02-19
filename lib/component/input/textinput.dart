import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
bool isEmail(String em) {
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = RegExp(p);

  return regExp.hasMatch(em);
}
Widget field(TextEditingController controller,String lab,{bool email=false,bool number =false,bool secure = false}){
  return TextFormField(
    obscureText: secure,
    controller: controller,
    keyboardType: number?TextInputType.phone:TextInputType.text,
    validator: (e){
      if(email){
      if(isEmail(e)){
        return null;
      }else{
        return "invalid email address";
      }
      }else if(e.length==0){
        return 'Field not filled';
      }else{
        return null;
      }
    },
    decoration:InputDecoration(
      labelText: lab,
      //border:OutlineInputBorder(),
    ),
  );
}

Widget nfield(TextEditingController controller,String lab,{bool email=false,bool number =false,bool secure = false}){
  return TextFormField(
    obscureText: secure,
    controller: controller,
    keyboardType:TextInputType.phone,
    validator: (e){
      if(email){
        if(isEmail(e)){
          return null;
        }else{
          return "invalid email address";
        }
      }else if(e.length==0){
        return 'Field not filled';
      }else{
        return null;
      }
    },
    decoration:InputDecoration(
      labelText: lab,
      //border:OutlineInputBorder(),
    ),
  );
}
Widget tfield(TextEditingController controller,String hint){
  return TextFormField(
    validator: (e){
      if(e.length==0){
        return 'Enter $hint';
      }else{
        return null;
      }
    },
    controller: controller,
    decoration: InputDecoration(
      border: UnderlineInputBorder(),
      hintText: hint
    ),
    keyboardType: TextInputType.number,
  );
}

Widget numfield(TextEditingController controller,String hint){
  return TextFormField(
    validator: (e){
      if(e.length>8){
        return 'Enter $hint';
      }else{
        return null;
      }
    },
    controller: controller,
    decoration: InputDecoration(
        border: UnderlineInputBorder(),
        hintText: hint
    ),
    keyboardType: TextInputType.number,
  );
}