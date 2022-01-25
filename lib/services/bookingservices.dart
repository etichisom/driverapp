import 'dart:convert';

import 'package:bullet_pro/Models/bookm.dart';
import 'package:bullet_pro/Models/rbook.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';

import 'authservice.dart';

class Bookingservices{

  Future<Bookm> wallet(String uid)async{
    try{
      var url = Uri.parse(baseurl+'/booking/driver_all');
      var map = {
        "driver_id":uid
      };
      var data = jsonEncode(map);
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
          var p = Bookm.fromJson(decode);
          return p;
        }else{

        }
      }
      print(res.body);
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }


  Acceptbook(String uid,String rid)async{
    try{
      var url = Uri.parse(baseurl+'/booking/accepted');
      var map = {
          "request_id":uid,
          "driver_id":rid

      };
      var data = jsonEncode(map);
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


        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }


  Bookarrived(var lat,String bid,var lon)async{
    try{
      var url = Uri.parse(baseurl+'/booking/arrived_driver');
      var map = {
        "booking_id":bid,
        "current_latitude":lat,
        "current_longitude":lon
      };
      var data = jsonEncode(map);
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


        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }

  Bookpickup(String bid,)async{
    try{
      var url = Uri.parse(baseurl+'/booking/pickup_driver');
      var map = {
        "booking_id":bid
      };
      var data = jsonEncode(map);
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


        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }

  Bookstart(String bid,)async{
    try{
      var url = Uri.parse(baseurl+'/booking/start');
      var map = {
        "booking_id":bid
      };
      var data = jsonEncode(map);
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


        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }



  Bookcancel(String bid,String did)async{
    try{
      var url = Uri.parse(baseurl+'/booking/cancle_by_driver');
      var map = {
        "booking_id":bid,
        "driver_id":did
      };
      var data = jsonEncode(map);
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


        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }
  Future<Rbook> recentBook(String did)async{
    try{
      var url = Uri.parse(baseurl+'/booking/recent_request');
      var map = {
        "driver_id":"3"
      };
      var data = jsonEncode(map);
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
          var d = Rbook.fromJson(decode);
          return d;
        }else{

        }
      }
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }
  }
}