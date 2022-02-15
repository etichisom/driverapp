import 'package:bullet_pro/Models/citym.dart';
import 'package:bullet_pro/Models/regionModel.dart';
import 'package:bullet_pro/Screens/verify_otp_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/services/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
Citym citym;
class ChangeRegionScreen extends StatefulWidget {


  @override
  _ChangeRegionScreenState createState() => _ChangeRegionScreenState();
}

class _ChangeRegionScreenState extends State<ChangeRegionScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  int stateindex = 0;
  bool apicall =false;
  start(){setState(() {apicall=true;});}
  stop(){setState(() {apicall=false;});}
  Authbloc authbloc;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    authbloc=Provider.of<Authbloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: themeColor,
        title: Text(
          "Change Region",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body:citym==null?Center(child: CircularProgressIndicator()):ListView(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            // physics: NeverScrollableScrollPhysics(),
            // reverse: false,
            shrinkWrap: true,
            itemCount: citym.data.length,

            itemBuilder: (context, index) => regionWidget(
              citym.data[index],
              index
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                ),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        start();
                         Settings().
                         updateregion(authbloc.user.data.driverId,
                             citym.data[stateindex].cityId)
                             .then((value){
                               stop();
                         });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        height: screenHeight / 18,
                        width: screenWidth / 1.1,
                        decoration: const BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                            right: 10,
                          ),
                          child:apicall?progress():Text(
                            "Save",
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget regionWidget(Data item,int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: Text(
                item.cityName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Spacer(),
            Radio(value:index,
                groupValue: stateindex,
                onChanged: (v){
              setState(() {
                stateindex=v;
              });
                })

          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Divider(
            color: Colors.black,
            indent: 5,
          ),
        ),
      ],
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Settings().Getcity().then((value){
      setState(() {
        citym=value;
      });
    });
  }
}
