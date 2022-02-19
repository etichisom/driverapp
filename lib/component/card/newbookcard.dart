import 'package:bullet/component/text/text.dart';
import 'package:bullet/theme/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Newcard extends StatelessWidget {
  String pickup;
  String location;

  Newcard({this.pickup, this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:Border.all(color:apptheme.maincolor,width: 1.5)
                ),
                height: 20,
                width: 20,
              ),
              Container(
                height: 70,
                width: 20,
                child: VerticalDivider(thickness: 2,),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:Border.all(color:Colors.grey[300],width: 1.5)
                ),
                height: 20,
                width: 20,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),

                  stext(
                    "PROPERTY SHOP, Sector 63 Road, A Block, Sector 65, Noida, Uttar Pradesh, India",
                    16.0,
                    color: HexColor('#146BB8'),
                    fontWeight: FontWeight.w500,
                  ),
                  Spacer(),
                  stext(
                    "D-77, Sector 63 Road, D Block, Sector 63, Noida, Uttar Pradesh, India",
                    16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,

                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
