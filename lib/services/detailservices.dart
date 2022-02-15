import 'dart:convert';

import 'package:bullet_pro/Screens/bottom_navigation_bar_screen.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';

class Detailservices{

  Future<bool> uploadpan(String image,String number,String uid)async{
    var map = {
      "document_front_site":image,
      "document_number":number,
      "driver_id":uid,
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/documents/pan');
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      print(decode);
      EasyLoading.showToast(decode['message']);
      if(res.statusCode==200){
        if(decode['status']==true){
        }else{

        }
      }
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }
  }


  Future<bool> uploaddl(String image,String image2,String number,String uid)async{
    var map = {
      "document_front_site":image,
      "document_back_site":image2,
      "document_number":number,
      "driver_id":uid,
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/documents/dl');
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      print(decode);
      EasyLoading.showToast(decode['message']);
      if(res.statusCode==200){
        if(decode['status']==true){
        }else{

        }
      }
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }
  }


  Future<bool> uploadaadhaar(String image,String image2,String number,String uid)async{
    var map = {
      "document_front_site":image,
      "document_back_site":image2,
      "document_number":number,
      "driver_id":uid,
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/documents/aadhaar');
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      print(decode);
      EasyLoading.showToast(decode['message']);
      if(res.statusCode==200){
        if(decode['status']==true){
        }else{

        }
      }
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }
  }




}