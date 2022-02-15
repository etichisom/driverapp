import 'package:bullet_pro/Models/help.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/services/infoservice.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Helpm helpm;
class HelpScreen extends StatefulWidget {


  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor,
        leading: SizedBox(),
        title: Text(
          "Help",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body:helpm==null?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: helpm.data.length,
        itemBuilder: (context,index){
          var d = helpm.data[index];
          return Column(
            children: [
              Container(
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          10,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    d.helpTitle.toString(),
                    style: GoogleFonts.roboto(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    d.helpShortDescription.toString(),
                    //maxLines: 4,
                    //softWrap: true,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  minVerticalPadding: 2,
                ),
              ),
              Divider(
                color: Colors.black,
              )
            ],
          );
        },

      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Infosettings().Gethelp().then((value){
      setState(() {
        helpm=value;
      });
    });
  }
}
