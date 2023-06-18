import 'package:flutter/material.dart';
import 'package:apotek/Widgets/field.dart';
import '../../Widgets/auth_button.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forget_password_three_page.dart';

class ForgetPasswordTwoPage extends StatelessWidget {
  const ForgetPasswordTwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/icons/Vector.png")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 33),
                child: Text(
                  "Forgot Password ?",
                  // style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 36, color: Colors.black)),
                ),
              ),
              SizedBox(height: 20,),
              Text("enter the verification code we just sent you on your email address", style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6),),),
              ),
              SizedBox(height: 39,),
              Field(hintText: "Enter your code verification ..."),
              SizedBox(height: 20,),
              Text.rich(
                TextSpan(
                  text: "if you didn't receive a code! ",
                  style: GoogleFonts.roboto(textStyle: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6),),),),
                  children: [
                    TextSpan(
                      text: "Resend",
                      style: GoogleFonts.roboto(textStyle: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color.fromRGBO(203, 0, 0, 1),),),),
                    )
                  ]

              )),
              SizedBox(height: 21,),
              AuthButton(text: "VERIFY", onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordThreePage(),));

              },),
            ],
          ),
        ),
      ),
    );
  }
}