import 'package:bullet_pro/Models/rbook.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/bloc/bookbloc.dart';
import 'package:bullet_pro/component/bookcard.dart';
import 'package:bullet_pro/component/bookcard2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Activebooking extends StatefulWidget {


  @override
  _AvailbeState createState() => _AvailbeState();
}

class _AvailbeState extends State<Activebooking> {
  Bookbloc bookbloc;
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    bookbloc = Provider.of<Bookbloc>(context);
    authbloc = Provider.of<Authbloc>(context);
    return Scaffold(
      body:bookbloc.bookstat==null?Center(child: CircularProgressIndicator()):ListView.builder(
          itemCount:bookbloc.bookstat.data.length,
          itemBuilder:(context,index){
            var data = bookbloc.bookstat.data[index];
            return bookcard2(data, context);
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

