import 'dart:io';

import 'package:apotek/Provider/auth_provider.dart';
import 'package:apotek/Views/botnavbar_home/camera_page.dart';
import 'package:apotek/Widgets/field.dart';
import 'package:apotek/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/auth_button.dart';
import '../../Model/account_model.dart';

class EditProfilePage extends StatelessWidget {
  EditProfilePage({super.key});
  File? imageFile;
  final nameControl = TextEditingController();
  final phoneControl = TextEditingController();
  final dateBirthControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<AuthProvider>(context, listen: false).getProfile;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset("assets/icons/Vector.png")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: Text(
                  "My Profile",
                  style: TextStyle(fontSize: 36, color: Colors.black, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  imageFile = await Navigator.push<File>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraPage(),
                      ));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: grey1),
                  child: imageFile != null ? Image.file(imageFile!) : SizedBox(),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Username",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36, color: Color.fromRGBO(0, 0, 0, 0.3)),
              ),
              Field(
                controller: nameControl,
                hintText: "Full Name",
              ),
              SizedBox(
                height: 20,
              ),
              Field(controller: dateBirthControl, hintText: "Date of Birth"),
              SizedBox(
                height: 20,
              ),
              Field(controller: phoneControl, hintText: "Mobile Number"),
              SizedBox(
                height: 20,
              ),
              Field(hintText: "Email"),
              SizedBox(
                height: 58,
              ),
              AuthButton(
                text: "Save",
                onPressed: () {
                  final data = AccountsModel(id: dataProvider.id, nama: nameControl.text.isEmpty ? dataProvider.nama : nameControl.text, email: dataProvider.email, password: dataProvider.password, dateBirth: dateBirthControl.text.isEmpty ? dataProvider.dateBirth : dateBirthControl.text, phone: phoneControl.text.isEmpty ? dataProvider.phone : phoneControl.text, username: dataProvider.username);
                  Provider.of<AuthProvider>(context, listen: false).editProfile(data);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
