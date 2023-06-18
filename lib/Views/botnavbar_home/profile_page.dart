import 'package:apotek/Provider/auth_provider.dart';
import 'package:apotek/Views/auth/welcome_page.dart';
import 'package:apotek/Views/botnavbar_home/edit_profile_page.dart';
import 'package:apotek/Views/payment/detail_order_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/account_model.dart';
import '../../Widgets/profile_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditProfilePage(),
                ));
          },
          child: Text(
            "Edit Profile",
            style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage(),));
            },
            child: Text(
              "Log Out",
              style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
      body: StreamBuilder<List<AccountsModel>>(
        stream: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;
            AccountsModel dataAccount = AccountsModel(nama: "", email: "", password: "", dateBirth: "", phone: "", username: "");
            for (var element in data!) {
              dataAccount.username = element.username;
              dataAccount.nama = element.nama;
              dataAccount.email = element.email;
              dataAccount.phone = element.phone;
              dataAccount.dateBirth = element.dateBirth;
              dataAccount.password = element.password;
              dataAccount.id = element.id;
            }
            Provider.of<AuthProvider>(context, listen: false).setAccount(dataAccount);
            return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
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
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image(
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            "assets/images/profile.png",
                            fit: BoxFit.contain,
                          );
                        },
                        image: NetworkImage("")),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    dataAccount.username,
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 36, color: Color.fromRGBO(0, 0, 0, 0.3)),
                  ),
                  ProfileData(
                    dataText: dataAccount.nama,
                  ),
                  ProfileData(
                    dataText: dataAccount.dateBirth,
                  ),
                  ProfileData(
                    dataText: dataAccount.phone,
                  ),
                  ProfileData(
                    dataText: dataAccount.email,
                  ),
                  ProfileData(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailOrder(),));
                    },
                    dataText: "Lihat Pesanan Saya",
                  ),
                ],
              ),
            ),
          );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator.adaptive(),);
          }
          return Container();
        }
      ),
    );
  }
}

Stream<List<AccountsModel>> getData() => FirebaseFirestore.instance.collection("Accounts").where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots().map((snapshots) => snapshots.docs.map((e) => AccountsModel.fromJson(e.data())).toList());
