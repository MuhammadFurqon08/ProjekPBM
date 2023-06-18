import 'package:apotek/Views/auth/welcome_page.dart';
import 'package:apotek/Widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/auth_button.dart';
import 'forget_password_two_page .dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

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
              Text("enter the email address associated with your account", style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6))),),
              SizedBox(height: 39,),
              Field(hintText: "Enter your email address"),
              SizedBox(height: 39,),
              AuthButton(text: "SEND", onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordTwoPage(),));

              },),
            ],
          ),
        ),
      ),
    );
  }
}