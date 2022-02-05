import 'package:bullet_pro/Models/bookstat.dart';
import 'package:bullet_pro/Models/rbook.dart';
import 'package:bullet_pro/services/bookingservices.dart';
import 'package:flutter/cupertino.dart';

class Bookbloc extends ChangeNotifier{
  Rbook rbook;
  Bookstat bookstat;
  Bookstat comstat;
  Future<Rbook> getrecentbook(String did)async{
   var book = await  Bookingservices().recentBook(did);
   if(book!=null){
     rbook=book;
     notifyListeners();
     return rbook;
   }else{
     rbook= Rbook.fromJson(emptybook);
     notifyListeners();
     return rbook;
   }
  }


  Future<Bookstat> getactivebook(String did)async{
    var book = await  Bookingservices().activeBook(did);
    if(book!=null){
      bookstat=book;
      notifyListeners();
      return bookstat;
    }else{
      bookstat=Bookstat.fromJson(emptybook);
      notifyListeners();
      return bookstat;
    }
  }

  Future<Bookstat> getcompbook(String did)async{
    var book = await  Bookingservices().comBook(did);
    if(book!=null){
      comstat=book;
      notifyListeners();
      return comstat;
    }else{
     comstat = Bookstat.fromJson(emptybook);
     notifyListeners();
     return comstat;

    }
  }
}

var emptybook = {
  "status": false,
  "message": "Booking Data Not Found !",
  "data":[]
};