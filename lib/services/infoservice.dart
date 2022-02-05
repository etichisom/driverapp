import 'dart:convert';
import 'package:bullet_pro/Models/driverd.dart';
import 'package:bullet_pro/Models/help.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';

class Infosettings{

  Future<Helpm> Gethelp()async{
    try{
      var url = Uri.parse(baseurl+'/helpquestion/for_driver');
      var res = await get(url,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      print(decode);
      if(res.statusCode==200){
        if(decode['status']==true){
          var p = Helpm.fromJson(decode);
          return p;
        }else{

        }
      }
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }
  }


  Future<Driverd> Getdetail(String id)async{
    var map = {
      "driver_id":id
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/driver/details');
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      print(decode);
      if(res.statusCode==200){
        if(decode['status']==true){
          var p = Driverd.fromJson(decode);
          return p;
        }else{

        }
      }
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }
  }
}