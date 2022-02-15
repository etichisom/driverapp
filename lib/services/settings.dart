import 'dart:convert';

import 'package:bullet_pro/Models/citym.dart';
import 'package:bullet_pro/Models/photoday.dart';
import 'package:bullet_pro/Models/referece.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';

class Settings{

  Future<bool> updaterefece(Map map)async{
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/driver/update_reference');
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



  Future<bool> updateregion(String id,String rid)async{
    var map = {
      "driver_id":id,
      "driver_region":rid
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/driver/update_region');
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

 Future<Citym> Getcity()async{
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
  Future<Refm> Getref(String uid)async{
    var map = {
      "driver_id":uid,
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/driver/update_reference');
      var res = await post(url,
          body: data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      print(decode);
      if(res.statusCode==200){
        if(decode['status']==true){
          var p = Refm.fromJson(decode);
          return p;
        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }


  Future<bool> updateprofile(String uid,String image)async{
    var map = {
      "driver_id":uid,
      "driver_image":image
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/driver/update_profile');
      var res = await post(url,
          body: data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      EasyLoading.showToast(decode['message'].toString());
      print(decode);
      if(res.statusCode==200){
        if(decode['status']==true){
          return true;
        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }


  Future<bool> uploadphoto(String uid,String image)async{
    var map = {
      "driver_id":uid,
      "driver_photo":image
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/driver/uploads_photo');
      var res = await post(url,
          body: data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      EasyLoading.showToast(decode['message'].toString());
      print(decode);
      if(res.statusCode==200){
        if(decode['status']==true){
          var p = true;
          return p;
        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }


  Future<Photoday> getphoto(String uid,)async{
    var map = {
      "driver_id":uid,
    };
    var data = jsonEncode(map);
    try{
      var url = Uri.parse(baseurl+'/driver/photo');
      var res = await post(url,
          body: data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      EasyLoading.showToast(decode['message'].toString());
      print(decode);
      if(res.statusCode==200){
        if(decode['status']==true){
          var p = Photoday.fromJson(decode);
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