import 'package:bullet_pro/Models/rbook.dart';
import 'package:bullet_pro/services/bookingservices.dart';
import 'package:flutter/cupertino.dart';

class Bookbloc extends ChangeNotifier{
  Rbook rbook;

  Future<Rbook> getrecentbook(String did)async{
   var book = await  Bookingservices().recentBook(did);
   if(book!=null){
     rbook=book;
     notifyListeners();
     return rbook;
   }
  }
}