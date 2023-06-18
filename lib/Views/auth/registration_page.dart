import 'package:apotek/Views/auth/common_information_page.dart';
import 'package:apotek/Model/account_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Widgets/field.dart';

class RegistPage extends StatelessWidget {
  RegistPage({super.key});
  final formKey = GlobalKey<FormState>();
  final usernameControl = TextEditingController();
  final emailControl = TextEditingController();
  final passControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 33),
                child: Text(
                  "Registration",
                  // style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 36, color: Colors.black)),
                ),
              ),
              Field(
                hintText: 'Create your username ...',
                controller: usernameControl,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("please fill field");
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 22,
              ),
              Field(
                hintText: "Email address ...",
                controller: emailControl,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("please fill field");
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 22,
              ),
              Field(
                hintText: "Create password ...",
                isPassword: true,
                controller: passControl,
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("please fill field");
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 54,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    try {
                      final data = AccountsModel(
                        nama: "", 
                        email: emailControl.text, 
                        password: passControl.text, 
                        dateBirth: "", 
                        phone: "", 
                        username: usernameControl.text
                        );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InfomationPage(dataAccount: data),
                          ));
                        emailControl.clear();
                        passControl.clear();
                        usernameControl.clear();
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  textStyle: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white)),
                  minimumSize: Size(MediaQuery.of(context).size.width, 52),
                  backgroundColor: Colors.black,
                ),
                child: const Text("NEXT"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
