import 'dart:convert';
import 'package:bullet_pro/Models/chatm.dart';
import 'package:bullet_pro/Models/ticketm.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';

import 'authservice.dart';
Chatservices chatservices = Chatservices();
class Chatservices{

  Future<bool> createticket(String uid,String subject,)async{
    try{
      var url = Uri.parse(baseurl+'/support/create_ticket_customer');
      print(uid);
      var map = {
        "customer_id":uid,
        "subject":subject
      };
      var data = jsonEncode(map);
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      print('sshahahahah');
      print(res.body);
      var decode = jsonDecode(res.body);
      EasyLoading.showToast(decode['message']);
      if(res.statusCode==200){
        if(decode['status']==true){
          return true;
        }else{

        }
      }
      print(res.body);
    }catch(e){
      print('hahahahah');
      print(e);
    }
  }




  Future<bool>sendmessage(String uid,String mess,String tid)async{
    try{
      var url = Uri.parse(baseurl+'/support/chat_customer');
      print(uid);
      var map =
        {
          "customer_id":uid,
          "ticket_id":tid,
          "message":mess
        }
      ;
      var data = jsonEncode(map);
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      print('sshahahahah');
      print(res.body);
      var decode = jsonDecode(res.body);
      //EasyLoading.showToast(decode['message']);
      if(res.statusCode==200){
        if(decode['status']==true){
          return true;
        }else{

        }
      }
      print(res.body);
    }catch(e){
      print('hahahahah');
      print(e);
    }
  }



  Future<Chatm>getmessage(String uid,String tid)async{
    try{
      var url = Uri.parse(baseurl+'/support/chat_list_customer');
      print(uid);
      var map =
      {
        "customer_id":uid,
        "ticket_id":tid,
      }
      ;
      var data = jsonEncode(map);
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      print('sshahahahah');
      print(res.body);
      var decode = jsonDecode(res.body);
      //EasyLoading.showToast(decode['message']);
      if(res.statusCode==200){
        if(decode['status']==true){
          var p = Chatm.fromJson(decode);
          return p;
        }else{

        }
      }
      print(res.body);
    }catch(e){
      print('hahahahah');
      print(e);
    }
  }


  Future<Ticketm>getticteks(String uid)async{
    try{
      var url = Uri.parse(baseurl+'/support/ticket_list_customer');
      print(uid);
      var map =
      {
        "customer_id":uid,
      }
      ;
      var data = jsonEncode(map);
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      print('sshahahahah');
      print(res.body);
      var decode = jsonDecode(res.body);
      //EasyLoading.showToast(decode['message']);
      if(res.statusCode==200){
        if(decode['status']==true){
          var p = Ticketm.fromJson(decode);
          return p;
        }else{

        }
      }
      print(res.body);
    }catch(e){
      print('hahahahah');
      print(e);
    }
  }

}