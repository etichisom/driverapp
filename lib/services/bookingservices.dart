import 'dart:convert';

import 'package:bullet_pro/Models/bookdetailsm.dart';
import 'package:bullet_pro/Models/bookm.dart';
import 'package:bullet_pro/Models/bookstat.dart';
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
      //EasyLoading.dismiss();
      print(e);
    }
  }
  Future<Bookstat> activeBook(String uid)async{
    try{
      var url = Uri.parse(baseurl+'/booking/driver_active_booking');
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
          var p = Bookstat.fromJson(decode);
          return p;
        }else{

        }
      }
      print(res.body);
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }
  }

  Future<Bookstat> comBook(String uid)async{
    try{
      var url = Uri.parse(baseurl+'/booking/driver_complete_booking');
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
          var p = Bookstat.fromJson(decode);
          return p;
        }else{

        }
      }
      print(res.body);
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }
  }


  Future<Map>Acceptbook(String uid,String rid)async{
    try{
      var url = Uri.parse(baseurl+'/booking/accepted');
      var map = {
          "request_id":rid,
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
          return decode;

        }else{

        }
      }
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }
  }


  Future<bool> Bookarrived(String bid)async{
    try{
      var url = Uri.parse(baseurl+'/booking/arrived_driver');
      var map = {
        "booking_id":bid,
        "current_latitude":"3131313213",
        "current_longitude":"23123213123"
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
      //EasyLoading.dismiss();
      print(e);
    }
  }

  Future<bool> Bookpickup(String bid,)async{
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

  Future<bool>dropoff(String bid,String did)async{
    try{
      var url = Uri.parse(baseurl+'/booking/update_drop_status');
      var map = {
        "booking_id":bid,
        "booking_drop_id":did,
        "current_latitude":"3131313213",
        "current_longitude":"23123213123"
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
        return true;

        }else{

        }
      }
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }


  }
  Future<bool> Bookstart(String bid,)async{
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
          return true;
        }else{
         return false;
        }
      }
    }catch(e){
      //EasyLoading.dismiss();
      print(e);
      return false;
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
      //EasyLoading.dismiss();
      print(e);
    }
  }


  Future<Rbook> recentBook(String did)async{
    try{
      var url = Uri.parse(baseurl+'/booking/recent_request');
      var map = {
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


  Future<Bookdetail> getbookbid(String bid)async{
    try{
      var url = Uri.parse(baseurl+'/booking/booking_details_for_driver');
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
          var d = Bookdetail.fromJson(decode);
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