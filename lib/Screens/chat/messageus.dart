
import 'package:bullet_pro/Models/ticketm.dart';
import 'package:bullet_pro/Utils/nav.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/component/background/chatbackground.dart';
import 'package:bullet_pro/component/text.dart';
import 'package:bullet_pro/services/ticket.dart';
import 'package:bullet_pro/theme/appthemes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'chatus.dart';

class Messegus extends StatefulWidget {
  @override
  State<Messegus> createState() => _MessegusState();
}
Ticketm ticketm;
class _MessegusState extends State<Messegus> {
  Authbloc authbloc;

  @override
  Widget build(BuildContext context) {
    authbloc = Provider.of(context);
    Size size = MediaQuery.of(context).size;
    return Chatbackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius:15,
                      backgroundColor: Colors.white,
                      child: stext('B', 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightBlueAccent),
                    ),
                    SizedBox(height: 5,),
                    stext('Hi from Bullet', 23,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                    SizedBox(height: 5,),
                    stext('Ask us anything', 14,
                        color: Colors.white),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Card(
                elevation: 4,
                child: Container(
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        stext('Your conversation', 16,
                            fontWeight: FontWeight.w600,
                        ),
                        ListTile(
                          trailing: stext('46m ago', 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          leading: CircleAvatar(
                            radius:18,
                            child: stext('B', 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          title: stext('Bullet india', 13,
                              color: Colors.grey),
                          subtitle:stext('Back', 13,
                              fontWeight: FontWeight.w700,
                          ),
                        ),
                        OutlineButton.icon(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          onPressed: (){
                          //nav(Chat(), context);
                            showDialog(context: context,
                                builder: (context){
                              return SimpleDialog(
                                children: [
                                  Container(
                                      child: Ticketdia(),
                                  height: 200,
                                  width: double.maxFinite,)
                                ],
                              );
                                });
                         }
                        , icon: Icon(Icons.send,size: 17,
                          color: Colors.blue,), label:stext('Send us message', 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.lightBlueAccent),)
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
             authbloc.ticketm==null?SizedBox():ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: authbloc.ticketm.data.length,
                  itemBuilder:(context,index){
                  var d = authbloc.ticketm.data[index];
                  return Card(
                    elevation: 4,
                    child:Container(
                      width: size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            stext('Created at :   '+d.ticketCreateAt,14,fontWeight: FontWeight.w500,),
                            SizedBox(height: 5,),
                            stext('Subject',16,fontWeight: FontWeight.w600,),
                            SizedBox(height: 5,),
                            stext(d.ticketSubjects,14,),
                            Row(
                              children: [
                                stext(d.ticketStatus,14,color: color(d.ticketStatus)),
                                Spacer(),
                                OutlineButton.icon(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  onPressed: (){
                                    nav(Chat(d), context);
                                  }
                                  , icon: Icon(Icons.send,size: 17,
                                  color: Colors.blue,), label:stext('View or Reply', 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.lightBlueAccent),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );

                  } )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 200),(){
      authbloc.getticket(authbloc.user.data.driverId);


    });
  }

  color(String ticketStatus) {
    if(ticketStatus.toLowerCase().contains('pend')){
      return Colors.blue;
    }else if (ticketStatus.toLowerCase().contains('re')){
      return Colors.green;
    }
  }

}


class Ticketdia extends StatefulWidget {

  @override
  _CanceldiaState createState() => _CanceldiaState();
}

class _CanceldiaState extends State<Ticketdia > {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController controller = TextEditingController();
    Authbloc authBloc = Provider.of<Authbloc>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            TextField(
              controller: controller,
              decoration:InputDecoration(
                labelText: "Enter Message",
                border:OutlineInputBorder(),
                labelStyle: GoogleFonts.lato(fontSize: 12)
              ),
            ),
            //field(controller, 'Ticket Subject'),
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              ],
            ),
            SizedBox(height: 30,),
            FlatButton(
                color:appthemes.maincolor,
                onPressed: (){
                  if(controller.text!=null){
                    chatservices.createticket(authBloc.user.data.driverId,
                        controller.text).then((value){
                      authBloc.getticket(authBloc.user.data.driverId);
                      Navigator.pop(context);
                    });
                  }
                }, child:stext('send', 16,color: Colors.white))
          ],
        ),
      ),
    );
  }
}

