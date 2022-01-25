import 'package:bullet_pro/Models/regionModel.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeRegionScreen extends StatefulWidget {


  @override
  _ChangeRegionScreenState createState() => _ChangeRegionScreenState();
}

class _ChangeRegionScreenState extends State<ChangeRegionScreen> {
  double screenHeight = 0;
  double screenWidth = 0;

  List<RegionModel> region = [
    RegionModel(title: "Mumbai"),
    RegionModel(title: "Bengluru"),
    RegionModel(title: "Delhi/Ncr"),
    RegionModel(title: "Hydrabad"),
    RegionModel(title: "Chennai"),
    RegionModel(title: "Kolkata"),
    RegionModel(title: "Pune"),
    RegionModel(title: "Jaipur"),
    RegionModel(title: "Goa"),
    RegionModel(title: "Indore"),
    RegionModel(title: "Bhopal"),
    RegionModel(title: "Surat"),
    RegionModel(title: "Uttarakhand"),
    RegionModel(title: "Uttarpradesh"),
    RegionModel(title: "Punjab"),
  ];
  @override
  Widget build(BuildContext context) {
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
          "Change Region",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: screenHeight / 1.3,
            width: screenWidth,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              // physics: NeverScrollableScrollPhysics(),
              // reverse: false,
              shrinkWrap: true,
              itemCount: region.length,

              itemBuilder: (context, index) => regionWidget(
                region[index],
              ),
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const AddressProof(),
                        //   ),
                        // );
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
                          child: Text(
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

  Widget regionWidget(RegionModel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: Text(
            item.title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
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
}
