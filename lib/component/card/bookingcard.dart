import 'package:bullet/component/text/text.dart';
import 'package:bullet/model/bookhis.dart';
import 'package:bullet/model/his.dart';
import 'package:bullet/theme/apptheme.dart';
import 'package:bullet/ui/booking/bookdetails.dart';
import 'package:bullet/utils/nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:steps/steps.dart';

Widget bookcard(Data data,BuildContext context,{bool complete}){
  return InkWell(
    onTap: () {
    nav(Bookdetails(data.bookingId), context);
    },
    child: Card(
      elevation: 3,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  stext(rupee+data.bookingTotalAmount, 20,fontWeight: FontWeight.w600),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  stext(data.bookingDisplayStatus,15,
                      fontWeight: FontWeight.w600,
                      color:data.bookingDisplayStatus.toLowerCase().contains('cancel')?
                      Colors.red:data.bookingDisplayStatus.toLowerCase().contains('complete')?Colors.green:
                  Colors.grey[600]),
                  Spacer(),
                  stext('44116',15,
                      color: Color(0xFFABABAB).withOpacity(0.98) ),
                ],
              ),
              Container(
                height: 150,
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
                              border:Border.all(color: apptheme.maincolor,width: 1.5)
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
  );
}