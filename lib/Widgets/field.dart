import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Field extends StatelessWidget {
  String? hintText;
  bool? isPassword;
  int? maxLines;
  TextEditingController? controller;
  String? prefixText;
  String? Function(String?)? validator;
  Field({super.key, this.hintText, this.isPassword, this.maxLines, this.prefixText, this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines ??= 1,
      obscureText: isPassword ??= false,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.black)),
          hintText: hintText,
          hintStyle: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Color.fromRGBO(0, 0, 0, 0.5))),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 2, color: Colors.black))),
    );
  }
}
