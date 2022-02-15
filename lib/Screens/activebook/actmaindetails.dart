import 'package:bullet_pro/Models/rbook.dart';
import 'package:bullet_pro/Screens/activebook/actbookdetails.dart';
import 'package:bullet_pro/Screens/book/bookdetails.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/component/bookcard.dart';
import 'package:bullet_pro/component/text.dart';
import 'package:bullet_pro/services/bookingservices.dart';
import 'package:bullet_pro/services/noti.dart';
import 'package:bullet_pro/theme/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
Bookingservices bookingservices= Bookingservices();
class Maindetails1 extends StatefulWidget {

 ScrollController controller;
 Maindetails1(this.controller);

  @override
  _MaindetailsState createState() => _MaindetailsState();
}

class _MaindetailsState extends State<Maindetails1> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          height:40 ,
          width: double.maxFinite,
          decoration:BoxDecoration(
              color: appcolor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight:  Radius.circular(10)
              )
          ),
          child: Center(child: stext(book.data.bookingOrderId, 14,color: Colors.white,fontWeight: FontWeight.w600)),
        ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                stext(book.data.bookingPaymentsMode, 12),
                SizedBox(height: 20,),
                Row(
                  children: [
                    stext(rupee+book.data.bookingTotalAmount,17,fontWeight: FontWeight.w600),
                    Spacer(),
                    stext('for Delivery', 12),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Icon(Icons.work_outline_sharp),
                    SizedBox(width: 10,),
                    stext('Up to 50',14,fontWeight: FontWeight.w600),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15,),
          concenter('Parcel Details'),
          //radiotile(book.data..packageTypeName),
          radiotile('Riders with Delivery Bags ; Needed to Carry food parcels.'),
         contactile('+7876757765'),
          SizedBox(height: 15,),
          locate(1, 'Pickup Location'),
          SizedBox(height: 15,),
          locateion(book.data.bookingPickupAddress),
          contactile('+7876757765'),
          radiotile('Offline Paid Orders ; Do not ask for Online Payment at any point.'),
          //SizedBox(height: 5,),
          radiotile('Riders with Delivery Bags ; Needed to Carry food parcels.'),
          SizedBox(height: 15,),
          status('start')==false?dbutton('arrived'):
          button((){
            print('yyyyy');
            bookingservices.Bookarrived(book.data.bookingId).
            then((value){
              reset(book.data.bookingId);
              sendnoti(btoken, "Driver has arrived", book.data.bookingId);
            });
          },"Arrived",status('arrived')),
          SizedBox(height: 15,),
          status('arrived')?button((){
             bookingservices.Bookpickup(book.data.bookingId).
             then((value){
               reset(book.data.bookingId);
               sendnoti(btoken, "Driver has Pick up", book.data.bookingId);
             });
          },"Pick up",status('pickup')):status('completed')?
          button((){
            print('yyyyy');
            bookingservices.Bookpickup(book.data.bookingId).
            then((value){
              reset(book.data.bookingId);
            });
          },"Pick up",status('completed'))
              :dbutton('Pick up'),
          SizedBox(height: 15,),
          locate(2, 'Delivery Location'),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: book.data.bookingsDrop.length,
              itemBuilder:(context,index){
              var d = book.data.bookingsDrop[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  locateion(d.bookingDropAddress),
                  SizedBox(height: 15,),
                  status('pickup')?dropbutton((){
                    bookingservices.dropoff(book.data.bookingId,d.bookingDropId).
                    then((value){
                      reset(book.data.bookingId);
                      print('fffff');
                      sendnoti(btoken, "Drop of at ${d.bookingDropAddress}", book.data.bookingId);
                    });
                  }, 'Drop off',d.bookingDropStatus.toString().toLowerCase().contains('completed'))
                      :status('completed')?dropbutton((){

                  }, 'Drop off',status('completed')):SizedBox(),
                ],
              );
              }),


          SizedBox(height: 500,),

        ],
    );
  }
  Widget concenter(String title){
    return  Container(
      color:Color.fromRGBO(227, 255, 200, 1),
      width: double.maxFinite,
      height:50,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            stext(title.toString(), 16,color: Colors.black,fontWeight: FontWeight.w600),


          ],
        ),
      ),
    );
  }

 Widget radiotile(String s) {
    return
        RadioListTile(
            value:true, groupValue:true,
            activeColor: appcolor,
            onChanged: (v){},
          title: stext(s,14 ),
            );
  }
  Widget contactile(String number){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: ListTile(
          trailing: Icon(Icons.phone),
          title: stext('Customer Number',15 ,fontWeight: FontWeight.w600),
          subtitle:stext(number,14 ) ,
        ),
      ),
    );
  }
  
  Widget locate(int number,String title){
    return  Container(
      color: appcolor,
      width: double.maxFinite,
      height:50,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            SizedBox(width: 10,),
            CircleAvatar(
              radius: 15,
              child: stext(number.toString(), 17,color: apptheme.maincolor),
              backgroundColor: Colors.white,
            ),
            SizedBox(width: 10,),
            stext(title.toString(), 18,color: Colors.white,fontWeight: FontWeight.w600)
          ],
        ),
      ),
    );
  }

  Widget locateion(String locate){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           color: Colors.grey[200],
         ),
        child: ListTile(
         title: stext(locate,16,fontWeight: FontWeight.w500),
          trailing: Icon(Icons.map),
        ),
      ),
    );
  }

 Widget button(Function tap, String s,bool tapp) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: double.maxFinite,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
            onPressed:tapp?null:tap,
            color:HexColor('#7CFC00'),
            child:stext(s, 16,color: Colors.white,fontWeight: FontWeight.w600)),
      ),
    );
 }


  Widget dbutton( String s,) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: double.maxFinite,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed:null,
            color:HexColor('#7CFC00'),
            child:stext(s, 16,color: Colors.white,fontWeight: FontWeight.w600)),
      ),
    );
  }

  Widget dropbutton(Function ontap, String s,bool tap) {
  return SizedBox(
    width: 200,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton.icon(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        color: themeColor,
            onPressed:tap?null:ontap,
            icon:Icon(Icons.pin_drop,color: Colors.white,), label:stext('Drop off', 14,color: Colors.white)),
    ),
  );
}
  Widget acceptbutton(Function tap, String s) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: double.maxFinite,
        child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            onPressed: (){

            },
            color:themeColor,
            child:stext(s, 16,color: Colors.white,fontWeight: FontWeight.w600)),
      ),
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
  }
}
