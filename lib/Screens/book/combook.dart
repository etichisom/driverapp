import 'package:bullet_pro/Models/rbook.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/bloc/bookbloc.dart';
import 'package:bullet_pro/component/bookcard.dart';
import 'package:bullet_pro/component/bookcard2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Combooking extends StatefulWidget {


  @override
  _AvailbeState createState() => _AvailbeState();
}

class _AvailbeState extends State<Combooking> {
  Bookbloc bookbloc;
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    bookbloc = Provider.of<Bookbloc>(context);
    authbloc = Provider.of<Authbloc>(context);
    return Scaffold(
      body:bookbloc.comstat==null?Center(child: CircularProgressIndicator()):
      RefreshIndicator(
        onRefresh: ()async{
          await bookbloc.getcompbook(authbloc.user.data.driverId);
          return true;
        },
        child: ListView.builder(
            itemCount:bookbloc.comstat.data.length,
            itemBuilder:(context,index){
              var data = bookbloc.comstat.data[index];
              return bookcard2(data, context);
            } ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      bookbloc.getcompbook(authbloc.user.data.driverId);
      // print(authbloc.user);
    });
  }


}

