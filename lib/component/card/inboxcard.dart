import 'package:bullet/component/button/button.dart';
import 'package:bullet/component/text/text.dart';
import 'package:bullet/model/inbox.dart';
import 'package:bullet/theme/apptheme.dart';
import 'package:bullet/ui/booking/driver.dart';
import 'package:bullet/ui/booking/rate.dart';
import 'package:bullet/utils/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class Inboxcard extends StatelessWidget {
inboxmodel inbox;
BuildContext context;

Inboxcard(this.inbox, this.context);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        nav(Driver(), context);
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 stext(inbox.status,14,color: HexColor('#ACACAC')),
                 Container(
                    decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: apptheme.maincolor.withOpacity(0.2)
                          ),
                     child: Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: stext('444222',12,color: HexColor('#ACACAC')),
                     )),
               ],
             ),
              SizedBox(height: 17,),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title:stext(inbox.info,14,),
                leading: CircleAvatar(radius: 10,backgroundColor: Colors.green,),
              ),
              SizedBox(height:22 ,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(),
                  RatingBar(
                    rating: 2,
                    icon:Icon(Icons.star_rounded,size:25,color:apptheme.grey[300],),
                    starCount: 5,
                    spacing: 2,
                    size: 25,
                    isIndicator: false,
                    allowHalfRating: true,
                    onRatingCallback: (double value,ValueNotifier<bool> isIndicator){
                      print('Number of stars-->  $value');
                      //change the isIndicator from false  to true ,the       RatingBar cannot support touch event;
                      isIndicator.value=true;
                    },
                    color: apptheme.maincolor,
                  ),
                  SizedBox(height:10 ,),
                  Button(
                    radius: 20,
                    title: 'Rate',
                    ontap: (){
                      nav(Rate(), context);
                    },
                  )

                ],
              ),
            ],
          ),
        ),
      ));
  }
}
