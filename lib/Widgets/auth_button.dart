import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AuthButton extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  AuthButton({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
        textStyle: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white)),
        minimumSize: const Size(188, 43),
        backgroundColor: const Color(0xFF6FE5FF),
      ),
      child: Text(text),
    );
  }
}