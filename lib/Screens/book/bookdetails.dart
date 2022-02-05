import 'dart:async';
import 'package:bullet_pro/Screens/activebook/actbookdetails.dart';
import 'package:bullet_pro/Screens/book/maindetails.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/Utils/nav.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/bloc/bookbloc.dart';
import 'package:bullet_pro/component/text.dart';
import 'package:flutter/material.dart';
import 'package:bullet_pro/Models/rbook.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_polyline_draw/map_polyline_draw.dart';
import 'package:provider/provider.dart';


class Bookd extends StatefulWidget {
  Data data;

  Bookd(this.data);

  @override
  _BookdState createState() => _BookdState();
}

class _BookdState extends State<Bookd> {
  bool load = true;
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            MapPolyLineDraw(
              mapZoom:14.4746,
              apiKey:"AIzaSyC44N6yERgjg8AM_UOznKlflcEZWYE8tro",
              firstPoint: MapPoint(double.parse(widget.data.requestPickupLatitude), double.parse(widget.data.requestPickupLongitude)),
              secondPoint: MapPoint(double.parse(widget.data.orderRequestDrop.first.dropLatitude), double.parse(widget.data.orderRequestDrop.first.dropLongitude)),
            ),
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
                    child: Maindetails(widget.data,scrollController),
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
                      iconbutton((){
                        if(load){
                          load=false;
                          EasyLoading.show();
                          bookingservices.Acceptbook(authbloc.user.data.driverId,
                              widget.data.requestId).then((value){
                            EasyLoading.dismiss();
                                load=true;
                            if(value!=null){
                              bookbloc.getrecentbook(authbloc.user.data.driverId);
                              bookbloc.getactivebook(authbloc.user.data.driverId);
                              Navigator.pop(context,value['booking_id'].toString());

                            }

                          });
                        }
                         },"Accept Order",Icons.hourglass_top)
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
        setState(() {});
      }
    });
    bookbloc.getrecentbook(authbloc.user.data.driverId);
    bookbloc.getactivebook(authbloc.user.data.driverId);
  }


}
