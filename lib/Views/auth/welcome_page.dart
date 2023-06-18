import 'package:apotek/Views/auth/log_in_page.dart';
import 'package:apotek/Views/auth/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/auth_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "WELCOME!!",
              style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 36, color: Colors.black)),
            ),
            const SizedBox(
              height: 51,
            ),
            Image.asset("assets/images/welcome.png"),
            const SizedBox(
              height: 48,
            ),
            AuthButton(
              text: "REGISTER",
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistPage(),
                    ));
              },
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              "Do you have an account?",
              style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.5))),
            ),
            const SizedBox(
              height: 7,
            ),
            AuthButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              text: "LOGIN",
            ),
          ],
        ),
      ),
    );
  }
}


