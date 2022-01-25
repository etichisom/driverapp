import 'package:bullet_pro/Models/rbook.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/bloc/bookbloc.dart';
import 'package:bullet_pro/component/bookcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Availbe extends StatefulWidget {


  @override
  _AvailbeState createState() => _AvailbeState();
}

class _AvailbeState extends State<Availbe> {
  Bookbloc bookbloc;
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    bookbloc = Provider.of<Bookbloc>(context);
    authbloc = Provider.of<Authbloc>(context);
    return Scaffold(
      body:bookbloc.rbook==null?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount:bookbloc.rbook.data.length,
          itemBuilder:(context,index){
          var data = bookbloc.rbook.data[index];
         return bookcard(data, context);
      } ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 Future.delayed(Duration(milliseconds: 500),(){
   bookbloc.getrecentbook(authbloc.user.data.driverId);
  // print(authbloc.user);
 });
  }


}

