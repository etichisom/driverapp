import 'package:bullet_pro/Models/chatm.dart';
import 'package:bullet_pro/Models/ticketm.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/component/text.dart';
import 'package:bullet_pro/services/ticket.dart';
import 'package:bullet_pro/theme/appthemes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'messageus.dart';

class Chat extends StatefulWidget {
uData data;

Chat(this.data);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  Authbloc authBloc;
  TextEditingController controller = TextEditingController();
  Chatm chatm;
  @override
  Widget build(BuildContext context) {
    authBloc = Provider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: appthemes.maincolor.withOpacity(0.8),
              child: ListTile(
                horizontalTitleGap: 3,
                leading: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: Icon(CupertinoIcons.back,color: Colors.white,)),
                title: stext("Subject ", 16,color: Colors.white,fontWeight: FontWeight.w600),
                subtitle:stext(widget.data.ticketSubjects, 14,color: Colors.white,fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(child:Container(
              child:chatm==null?SizedBox():RefreshIndicator(
                onRefresh:getchats,
                child: ListView.builder(
                  itemCount: chatm.data.chatList.length,
                    itemBuilder:(context ,index){
                    var d = chatm.data.chatList[index];
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(

                         child: Align(
                           alignment: d.chatMessagePosition.toLowerCase().contains('right')?Alignment.bottomRight:Alignment.bottomLeft,
                           child: Container(
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: d.chatMessagePosition.toLowerCase().contains('left')?Colors.white:appthemes.maincolor,
                             ),
                               child: Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: stext(d.chatMessage, 15,color:d.chatMessagePosition.toLowerCase().contains('left')?appthemes.maincolor:Colors.white),
                               )),
                         ),
                       ),
                     );
                    }
                ),
              ),
            )),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: TextField(
                          controller: controller,
                          decoration:InputDecoration(
                            enabledBorder:InputBorder.none ,
                              focusedBorder:InputBorder.none ,
                              hintText: "Enter Message",
                              border:InputBorder.none,
                              labelStyle: GoogleFonts.lato(fontSize: 12,color: Colors.grey)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton.icon(

                        icon: Icon(Icons.send,color: Colors.white,),
                          color:appthemes.maincolor,
                          onPressed: (){
                          var v =  controller.text;
                            if(v!=null){
                              controller.clear();
                              chatservices.sendmessage(authBloc.user.data.driverId,
                                  v, widget.data.ticketId).
                              then((value) {
                                getchat();

                              });
                            }
                          }, label:stext('send', 16,color: Colors.white)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }

 Widget pic(String s, String t) {
    return Column(
      children: [
        CircleAvatar(
          radius:21,
        ),
        SizedBox(height: 5,),
        stext(s, 14,color: Colors.white)
      ],
    );
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 200),(){
      getchat();
    });
  }
  getchat(){
    chatservices.getmessage(authBloc.user.data.driverId,widget.data.ticketId).
    then((value){
      if(value!=null){
        setState(() {
          chatm=value;
        });
      }
    });
  }

  Future<void> getchats() async{
    var c = await chatservices.getmessage(authBloc.user.data.driverId,widget.data.ticketId);
    if(c!=null){
      setState(() {
        chatm=c;
      });
    }
    return null;
  }
}
