import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';

import 'authservice.dart';

sendnoti(String token,String title,String id,{String message='Booking status'})async{
  print(token);
  print('jsjdjdjd');
    try{
      var url = Uri.parse(baseurl+'/test/notifictions');
      var map = {
        "title":title,
        "message":message,
        "screen":"notification",
        "payload":id,
        "data_id":10,
        "token":token
      };
      var data = jsonEncode(map);
      print(data);
      var res = await post(url,
          body:data,
          headers: {
            "Content-Type": "application/json",
            'x-api-key':key
          });
      var decode = jsonDecode(res.body);
      print(decode);

    }catch(e){
      //EasyLoading.dismiss();
      print(e);
    }

}