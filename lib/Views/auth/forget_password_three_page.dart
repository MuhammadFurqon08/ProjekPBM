import 'package:apotek/Views/auth/log_in_page.dart';
import 'package:apotek/Widgets/field.dart';
import '../../Widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordThreePage extends StatelessWidget {
  const ForgetPasswordThreePage({super.key});

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
                  "Reset your password!",
                  // style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 36, color: Colors.black)),
                ),
              ),
              SizedBox(height: 20,),
              Text("It’s okay! Reset your new password", style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, color: Color.fromRGBO(0, 0, 0, 0.6))),),
              SizedBox(height: 39,),
              Field(hintText: "Create your new password! ...", isPassword: true,),
              SizedBox(height: 27,),
              Field(hintText: "Confirm your new password! ...", isPassword: true,),
              SizedBox(height: 39,),
              AuthButton(text: "RESET PASSWORD", onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));

              },),
            ],
          ),
        ),
      ),
    );
  }
}