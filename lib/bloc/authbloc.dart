
import 'package:bullet_pro/Models/driverd.dart';
import 'package:bullet_pro/Models/driverm.dart';
import 'package:bullet_pro/Models/ticketm.dart';
import 'package:bullet_pro/Models/walletm.dart';
import 'package:bullet_pro/services/authservice.dart';
import 'package:bullet_pro/services/ticket.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Authbloc extends ChangeNotifier{
  Userd user;
  Walletm walletm;
  Ticketm ticketm;
  Driverd driverd;
  logout(){
    user =null;
    notifyListeners();
  }

  Future<Ticketm>getticket(String uid)async{
    var data = await chatservices.getticteks(uid);
    if(data!=null){
      ticketm=data;
      notifyListeners();
      return data;
    }else{
      return null;
    }

  }
 setuser(Userd userd){
    user=userd;
    notifyListeners();
 }
 setd(Driverd user){
    driverd= user;
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
  setuserd(Userd userd){
    user=userd;
    notifyListeners();
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