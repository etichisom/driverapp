import 'package:bullet_pro/Screens/login_screen.dart';
import 'package:bullet_pro/Utils/color.dart';
import 'package:bullet_pro/Utils/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNewPassword extends StatefulWidget {


  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  FocusNode _passwordNode = FocusNode();
  FocusNode _confirmpasswordNode = FocusNode();
  double screenHeight = 0;
  double screenWidth = 0;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/back4.jpg",
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 10,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 20,
                  ),
                  child: Text(
                    "Create New Password",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 20,
                  ),
                  child: Text(
                    "Your new password must be differnt from \nPrevious used passwords?",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 40,
                    left: 20,
                  ),
                  width: screenWidth / 1.13,
                  child: CustomTextField(
                    label: "Password",
                    hintText: "XXXXX",
                    controller: _passwordController,
                    focusNode: _passwordNode,
                    nextFocus: _confirmpasswordNode,
                    onSubmit: () {},
                    onChanged: () {},
                    // prefixIcon: Icons.lock,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    left: 20,
                  ),
                  width: screenWidth / 1.13,
                  child: CustomTextField(
                    label: "Confirm Password",
                    hintText: "XXXXX",
                    controller: _confirmPasswordController,
                    focusNode: _passwordNode,
                    nextFocus: _confirmpasswordNode,
                    onSubmit: () {},
                    onChanged: () {},
                    //prefixIcon: Icons.lock,
                  ),
                ),
                buttonWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonWidget() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  LoginScreen(),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 50,
              ),
              height: screenHeight / 14,
              width: screenWidth / 1.4,
              decoration: const BoxDecoration(
                color: themeColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    35,
                  ),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        right: 00,
                      ),
                      child: Text(
                        "Reset Password",
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(
                        left: 30,
                      ),
                      height: screenHeight / 16,
                      width: screenWidth / 8,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            100,
                          ),
                        ),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: textColor,
                          size: 18,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
