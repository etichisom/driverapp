import 'dart:async';

import 'package:bullet_pro/Screens/book/maindetails.dart';
import 'package:flutter/material.dart';
import 'package:bullet_pro/Models/rbook.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_polyline_draw/map_polyline_draw.dart';


class Bookd extends StatefulWidget {
  Data data;

  Bookd(this.data);

  @override
  _BookdState createState() => _BookdState();
}

class _BookdState extends State<Bookd> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
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
              minChildSize: 0.15,
              maxChildSize: 1,
              builder: (BuildContext context, ScrollController scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  physics: BouncingScrollPhysics(),
                  child:Container(
                    decoration:BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight:  Radius.circular(30)
                      )
                    ),
                    height:size.height ,
                    width:size.width ,
                    child: Maindetails(widget.data,scrollController),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
