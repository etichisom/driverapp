
import 'package:bullet_pro/Models/driverm.dart';
import 'package:bullet_pro/Models/walletm.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Authbloc extends ChangeNotifier{
  Userd user;
  Walletm walletm;
  logout(){
    user =null;
    notifyListeners();
  }
 setuser(Userd userd){
    user=userd;
    notifyListeners();
 }
  Future<Userd>login(String otp)async{
   var data = await Authservice().Verifify(otp: otp);
   if(data!=null){
     user=data;
     notifyListeners();
     return data;
   }else{
     return null;
   }

  }
  Future<Walletm>wallet(String uid)async{
    var data = await Authservice().wallet(uid);
    if(data!=null){
      walletm=data;
      notifyListeners();
      return data;
    }else{
      return null;
    }

  }
}