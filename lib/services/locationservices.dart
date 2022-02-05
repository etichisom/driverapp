import 'dart:convert';

import 'package:bullet_pro/Screens/bottom_navigation_bar_screen.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';

class Locationservices{

  Future<bool> updatestatus(String id,String status)async{
    var map = {
      "driver_id":id,
      "driver_status":status,
      "driver_latitude":position.latitude,
      "driver_longitude":position.longitude
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/driver/online_offline');
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



   updatelocation(String id,String status)async{
    var map = {
      "driver_id":"1",
      "driver_latitude":"123123.12312321",
      "driver_longitude":"123123"
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/driver/updatelocation');
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