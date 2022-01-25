import 'dart:convert';

import 'package:bullet_pro/Models/citym.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';

class Settings{

 Future<Citym> Getcity(String bid,String did)async{
    try{
      var url = Uri.parse(baseurl+'/cities');
      var res = await get(url,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      print(decode);
      if(res.statusCode==200){
        if(decode['status']==true){
          var p = Citym.fromJson(decode);
          return p;
        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }
}