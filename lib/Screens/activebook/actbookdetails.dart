import 'dart:async';

import 'package:bullet_pro/Models/bookdetailsm.dart';
import 'package:bullet_pro/Screens/book/bookdetails.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/bloc/bookbloc.dart';
import 'package:bullet_pro/component/text.dart';
import 'package:bullet_pro/services/bookingservices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bullet_pro/Models/rbook.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_polyline_draw/map_polyline_draw.dart';
import 'package:provider/provider.dart';

import 'actmaindetails.dart';

Bookdetail book;
class Abookd extends StatefulWidget {
  String bookid;

  Abookd(this.bookid);

  @override
  _BookdState createState() => _BookdState();
}

class _BookdState extends State<Abookd> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Bookbloc bookbloc;
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    authbloc=Provider.of<Authbloc>(context);
    bookbloc = Provider.of<Bookbloc>(context);
    Size size=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (){
        book=null;
        Navigator.pop(context);
        return null;
      },
      child: SafeArea(
        child: Scaffold(
          body:book==null?Center(child: CupertinoActivityIndicator()):Stack(
            children: [
              DraggableScrollableSheet(
                initialChildSize: 0.30,
                minChildSize: 0.17,
                maxChildSize: 1,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(

                    decoration:BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight:  Radius.circular(15)
                      )
                    ),
                    width:size.width,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Maindetails1(scrollController),
                    ),
                  );
                },
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.13,
                minChildSize: 0.13,
                maxChildSize: 0.13,
                builder: (BuildContext context, ScrollController scrollController) {
                  return Container(
                    height: 500,
                    decoration:BoxDecoration(
                        color: Colors.white,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 15.0,
                            spreadRadius: 15.0,
                            offset: Offset(0.0, 25.0),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight:  Radius.circular(15)
                        )
                    ),
                    width:size.width,
                    child: SingleChildScrollView(
                      controller:scrollController,
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            status('start')==false?
                                iconbutton((){
                            bookingservices.Bookstart(book.data.bookingId.toString())
                                 .then((value){
                                   reset(book.data.bookingId);
                             });

                           },"Start Order",Icons.hourglass_top):
                            iconbutton((){

                            },"Complete Order",Icons.check),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget iconbutton(Function ontap, String s,IconData iconData) {
    return SizedBox(
      width: double.maxFinite,
      height: 55,
      child: FlatButton.icon(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: themeColor,
          onPressed:ontap,
          icon:Icon(iconData,color: Colors.white,), label:stext(s, 16,color: Colors.white,fontWeight: FontWeight.w600)),
    );
  }

  void reset(String id) {
    bookingservices.getbookbid(id)
        .then((value){
      if(value!=null){
        book=value;
        setState(() {});
      }
    });
    bookbloc.getrecentbook(authbloc.user.data.driverId);
    bookbloc.getactivebook(authbloc.user.data.driverId);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bookingservices.getbookbid(widget.bookid)
        .then((value){
      if(value!=null){
        book=value;
        setState(() {});
      }
    });
  }

}
bool status(String i){
  print(book.data.bookingStatus);
  return book.data.bookingStatus.toLowerCase().contains(i);
}