

import 'package:bullet_pro/Models/bookstat.dart';
import 'package:bullet_pro/Screens/activebook/actbookdetails.dart';
import 'package:bullet_pro/Screens/book/bookdetails.dart';
import 'package:bullet_pro/Utils/nav.dart';
import 'package:bullet_pro/component/text.dart';
import 'package:bullet_pro/theme/apptheme.dart';
import 'package:flutter/material.dart';
var rupee= '₹';
Widget bookcard2(Data data,BuildContext context,{bool complete}){
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: InkWell(
      onTap: () {
        nav(Abookd(data.bookingId), context);
      },
      child: Card(
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black,width: 0.5)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    stext(rupee+data.bookingTotalAmount, 20,fontWeight: FontWeight.w600),
                    Spacer(),
                    stext('44116',15,
                        color: Color(0xFFABABAB).withOpacity(0.98) ),
                  ],
                ),
                Container(
                  height: 130,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:Border.all(color: apptheme.maincolor,width: 1.5)
                            ),
                            height: 17,
                            width: 17,
                          ),
                          Container(
                            height: 50,
                            width: 20,
                            child: VerticalDivider(thickness: 2,),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:Border.all(color:apptheme.maincolor,width: 1.5)
                            ),
                            height: 17,
                            width: 17,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(width: 7,),
                      Expanded(
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Spacer(),

                              stext(
                                data.bookingPickupAddress,
                                12.0,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              Spacer(),
                              stext(
                                data.bookingsDrop.first.bookingDropAddress,
                                12,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,

                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    ),
  );
}
