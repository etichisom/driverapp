import 'package:bullet_pro/Models/referece.dart';
import 'package:bullet_pro/Screens/verify_otp_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/bloc/authbloc.dart';
import 'package:bullet_pro/services/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
Refm refm;
class RefrencesScreen extends StatefulWidget {


  @override
  _RefrencesScreenState createState() => _RefrencesScreenState();
}

class _RefrencesScreenState extends State<RefrencesScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  bool apicall =false;
  start(){setState(() {apicall=true;});}
  stop(){setState(() {apicall=false;});}
  Authbloc authbloc;
  TextEditingController name = TextEditingController();
  TextEditingController name1 = TextEditingController();
  TextEditingController rela = TextEditingController();
  TextEditingController rela1 = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController num1 = TextEditingController();
  TextEditingController date1 = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController time1 = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    authbloc=Provider.of<Authbloc>(context);
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
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
          "Refrences",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: Form(
        key: key,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(
                            100,
                          ))),
                      child: Text(
                        "1",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Text(
                      "Refrences",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            textFieldsWidget(name,rela,num,date,time),
            Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: themeColor,
                      borderRadius: BorderRadius.all(Radius.circular(
                        100,
                      ))),
                  child: Text(
                    "2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  "Refrences",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            textFieldsWidget(name1,rela1,num1,date1,time1),
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
                      if(key.currentState.validate()){
                        Map m ={
                          "driver_id":authbloc.user.data.driverId,
                          "first_reference_name":name.text,
                          "first_reference_relation":rela.text,
                          "first_reference_mobile":num.text,
                          "first_reference_date":date.text,
                          "first_reference_time":time.text,
                          "second_reference_name":name1.text,
                          "second_reference_relation":rela1.text,
                          "second_reference_mobile":num1.text,
                          "second_reference_date":date1.text,
                          "second_reference_time":time1.text
                        };
                        start();
                        Settings().updaterefece(m).
                        then((value) {
                          stop();
                        });
                      }
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
      ),
    );
  }

  Widget textFieldsWidget(TextEditingController person,
      TextEditingController relation ,
      TextEditingController number,
      TextEditingController dates,
      TextEditingController times) {
dates.text='123457788';
times.text='123457788';
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextFormField(
            controller: person,
            validator: validate,
            decoration: InputDecoration(
              labelText: "Refrence Person name*",
              hintText: "Name",
              border: new OutlineInputBorder(
                borderSide: new BorderSide(
                  color: textColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height:10,),
          TextFormField(
            controller: relation,
            validator: validate,
            decoration: InputDecoration(
              labelText: "Relation*",
              hintText: " Name",
              border: new OutlineInputBorder(
                borderSide: new BorderSide(
                  color: textColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height:10,),
          TextFormField(
            validator: validate,
            controller: number,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Mobile Number*",
              hintText: " Name",
              border: new OutlineInputBorder(
                borderSide: new BorderSide(
                  color: textColor,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(height:10,),

        ],
      ),
    );
  }

  String validate(String e) {
    if(e.length==0){
        return "Enter field";
      }else{
        return null;
      }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 200),(){
      print(authbloc.user.data.driverId);
      Settings().Getref(authbloc.user.data.driverId).then((value){
        setState(() {
          if(value!=null){
            var f  = value.data.firstReference;
            var s  = value.data.firstReference;
            name.text=f.referenceName;
            num.text=f.referenceMobile;
            date.text=f.referenceDate;
            rela.text=f.referenceRelation;
            time.text=f.referenceTime;
          }
        });
      });
    });
  }
}
