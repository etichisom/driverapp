import 'dart:convert';
import 'dart:typed_data';


import 'package:bullet_pro/Models/driverm.dart';
import 'package:bullet_pro/Models/walletm.dart';
import 'package:bullet_pro/Screens/login_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
var baseurl = 'https://adminpanel.bulletexpresscourier.com/api/v1';
var key ='7c4a8d09ca3762af61e59XAPI520943dc26494f8941b';
var head = {
  'x-api-key':key
};
class Authservice{


  Future<bool> createaccount ({String number,String
  name,String type,String token,String fname,String lname,Uint8List image})async{
    print(ktoken);
    try{
      var url = Uri.parse(baseurl+'/driver/signup');
      var map = {
        "driver_region":"2",
        "driver_mobile":number,
        "driver_device_token":ktoken,
        "driver_firstname":fname,
        "driver_lstname":lname,
        "driver_image":image,
        "driver_employeetype":type
      };
      var data = jsonEncode(map);
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      print('yhhh');
      print(res.body);
      var decode = jsonDecode(res.body);
      EasyLoading.showToast(decode['message']);
      if(res.statusCode==200){
        if(decode['status']==true){
          if(decode['is_exists']==0){
            return true;
          }else{
           // EasyLoading.showError(decode['message']);
            return false;
          }

        }
        else{
          //EasyLoading.showError(decode['message']);
          return false;
        }
      }

    }catch(e){
      //EasyLoading.dismiss();
      //EasyLoading.showError('Something went wrong');
      return false;
    }
  }

  Future<bool> Login({String number,String password,String token})async{

   try{
     var url = Uri.parse(baseurl+'/driver/checkdriver');
     var map = {
       "driver_mobile":'7897773428',
       "driver_device_token":ktoken
     };
     var data = jsonEncode(map);
     var res = await post(url,
         body:data,
         headers: {
           "Content-Type": "application/json",
           'x-api-key':key
         });
     print('hhdhhdhdhd');
     var decode = jsonDecode(res.body);
     print(res.body);
     if(res.statusCode==200){
       if(decode['status']==true&&decode['is_exists']==1){
         //EasyLoading.showSuccess(decode['message'].toString());
         return true;
       }else{
         //EasyLoading.showError(decode['message'].toString());
         return false;
       }
     }
   }catch(e){
     EasyLoading.dismiss();
     EasyLoading.showError('something went wrong');
     return false;
   }
  }

  Future<bool> Logout({String uid,String lat,String log})async{

    try{
      var url = Uri.parse(baseurl+'/driver/checkdriver');
      var map = {
        "driver_id":uid,
        "driver_latitude":lat,
        "driver_longitude":log
      };
      var data = jsonEncode(map);
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      print('hhdhhdhdhd');
      var decode = jsonDecode(res.body);
      print(res.body);
      if(res.statusCode==200){
        if(decode['status']==true&&decode['is_exists']==1){
          EasyLoading.showSuccess(decode['message']);
          return true;
        }else{
          EasyLoading.showError(decode['message']);
          return false;
        }
      }
    }catch(e){
      EasyLoading.dismiss();
      EasyLoading.showError('something went wrong');
      return false;
    }
  }



  Future<Userd> Verifify({String otp})async{
   try{
     var url = Uri.parse(baseurl+'/driver/otp_verification');
     var map = {
       "otp_text":otp
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
         //EasyLoading.showSuccess(decode['message']);
         Hive.box('auth').put('auth', decode);
         return Userd.fromJson(decode);
       }else{
         //EasyLoading.showError(decode['message']);
         return null;
       }
     }
     print(res.body);
   }catch(e){
   print(e);
   }
  }


  Future<Walletm> wallet(String uid)async{
    try{
      var url = Uri.parse(baseurl+'/wallets/driver_wallet');
      var map = {
        "customer_id":uid
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
          var p = Walletm.fromJson(decode);
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

   Reffalledby(String uid,String referralid)async{
    try{
      var url = Uri.parse(baseurl+'/driver/update_referral');
      var map = {
        "driver_id":uid,
        "driver_referral_by":"DUS0000014"
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
        print(decode['message']);
        if(decode['status']==true){


        }else{

        }
      }
      print(res.body);
    }catch(e){
      EasyLoading.dismiss();
      print(e);
    }
  }

}