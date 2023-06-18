import 'package:apotek/Views/auth/forget_password_page.dart';
import 'package:apotek/Widgets/bot_nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Widgets/field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
                child: const Text(
                  "Log In",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
                ),
              ),
              Field(
                hintText: 'Email',
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
                hintText: "Password",
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
                height: 8,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPasswordPage(),
                      ));
                },
                child: Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Color(0xFFCB0000)),
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              ElevatedButton(
                onPressed: () async{
                  if (formKey.currentState!.validate()) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailControl.text, password: passControl.text)
                      .then((value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BotNavBar(),
                      )));
                    }on FirebaseAuthException catch (e) {
                      print(e);
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white),
                  minimumSize: Size(MediaQuery.of(context).size.width, 52),
                  backgroundColor: Colors.black,
                ),
                child: const Text("LOGIN"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
