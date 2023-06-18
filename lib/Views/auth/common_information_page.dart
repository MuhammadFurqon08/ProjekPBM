import 'package:apotek/Provider/auth_provider.dart';
import 'package:apotek/Views/auth/log_in_page.dart';
import 'package:apotek/Model/account_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Widgets/field.dart';

class InfomationPage extends StatelessWidget {
  final AccountsModel dataAccount;
  InfomationPage({super.key, required this.dataAccount});
  final formKey = GlobalKey<FormState>();
  final nameControl = TextEditingController();
  final birthControl = TextEditingController();
  final phoneControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/icons/Vector.png")),
      ),
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
                  "Informasi Umum",
                  // style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
                  style: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 36, color: Colors.black)),
                ),
              ),
              Field(
                hintText: 'Write your full name ...',
                controller: nameControl,
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
                hintText: "Write your date of birth ...",
                controller: birthControl,
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
                hintText: "Write mobile number ...",
                controller: phoneControl,
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
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      final data = AccountsModel(nama: nameControl.text, email: dataAccount.email, password: dataAccount.password, dateBirth: birthControl.text, phone: phoneControl.text, username: dataAccount.username);
                      // print(data.toJson().values);
                      Provider.of<AuthProvider>(context, listen: false).registerAccount(data);
                      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: dataAccount.email, password: dataAccount.password).then((value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          )));
                      nameControl.clear();
                      birthControl.clear();
                      phoneControl.clear();
                    } on FirebaseAuthException catch (e) {
                      print(e);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  textStyle: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white)),
                  minimumSize: Size(MediaQuery.of(context).size.width, 52),
                  backgroundColor: Colors.black,
                ),
                child: const Text("REGISTER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
