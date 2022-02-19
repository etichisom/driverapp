import 'package:bullet/component/text/text.dart';
import 'package:bullet/theme/apptheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Dbox extends StatelessWidget {
String title;
IconData iconData;
int cindex,index;
bool left;


Dbox({@required this.title, @required this.iconData,
  @required this.cindex, @required this.index,this.left=true});

@override
Widget build(BuildContext context) {
  return Expanded(
    child: Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius:left?BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft:Radius.circular(10)
        ):BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10)
        ),
          //border: Border.all(color: Colors.grey[300]),
          color: index==cindex?apptheme.maincolor:Colors.grey[100]
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                   Icon(iconData,size: 25,
                   color: index==cindex?Colors.white:HexColor('#B7B7B7'),),
                     Column(
                       children: [
                         SizedBox(height: 3,),
                          stext(title, 15,color: index==cindex?Colors.white:Colors.black),
                         SizedBox(height: 3,),


                       ],
                     ),

                  ],
                ),
              ),
            ),
            CircleAvatar(
              radius: 10,
              backgroundColor:index==cindex?Colors.white:HexColor('#B7B7B7') ,
              child: Icon(Icons.arrow_forward_ios_outlined,size: 10,
                color: index==cindex?Colors.black:Colors.black,),
            ),
          ],
        ),
      ),
    ),
  );
}
}

Widget rtext(){
  return stext('The Courier will be with you within 45 minutes',
      18,color: apptheme.grey);
}


class Dbox1 extends StatelessWidget {
  String title,top;
  IconData iconData;
  int cindex,index;


  Dbox1({@required this.title,
    @required this.iconData,
    @required this.cindex,
    @required this.index,this.top=''});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 93,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //border: Border.all(color: Colors.grey[300]),
          color: index==cindex?apptheme.maincolor:Colors.grey[100]
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            SizedBox(height: 5,),
            stext(top, 10,color: index==cindex?Colors.white:Colors.black),
            Spacer(),
            Icon(iconData,size: 35,
              color: index==cindex?Colors.white:Colors.grey[500],),
            Spacer(),
            stext(title, 11,color: index==cindex?Colors.white:Colors.black),
            SizedBox(height: 5,),

          ],
        ),
      ),
    );
  }

}

class Dbox2 extends StatelessWidget {
  String title;
  IconData iconData;
  int cindex,index;


  Dbox2({@required this.title,
    this.iconData,
    @required this.cindex,
    @required this.index,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]),
          color: index==cindex?apptheme.maincolor:Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconData==null?SizedBox():Icon(iconData,size: 20,
              color: index==cindex?Colors.white:Colors.black,),
            SizedBox(width: 10,),
            stext(title, 16,color: index==cindex?Colors.white:Colors.black),
          ],
        ),
      ),
    );
  }

}