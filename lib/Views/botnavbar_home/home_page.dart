import 'package:apotek/Model/account_model.dart';
import 'package:apotek/Provider/auth_provider.dart';
import 'package:apotek/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "";
    const String warn = "It is important to note that the use of drugs must be carried out according to the doctor's instructions and with the right prescription. Each medication has potential side effects and interactions with other medications, so it's important to consult a medical professional before using any medication.";
    return Scaffold(
      backgroundColor: blueBG,
      body: StreamBuilder<List<AccountsModel>>(
        stream: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
          final data = snapshot.data!;
             for (var element in data) {
            name = element.nama;
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: grey1,
                    radius: 30,
                  ),
                  title: Text(
                    "Hi, $name",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                  ),
                  subtitle: Text(
                    "You will be fine. You will heal and be who you used to be. get well soon!",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: Colors.black),
                  ),
                  isThreeLine: true,
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: const InputDecoration(enabledBorder: InputBorder.none, filled: true, fillColor: Colors.white, prefixIcon: Icon(Icons.search), hintText: "find the name of the drug ...", hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 11, color: Color.fromRGBO(0, 0, 0, 0.38))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/batuk.png"),
                        const Text(
                          "Batuk, Pilek, & Flu",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/images/alergi.png"),
                        const Text(
                          "Alergi",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/images/pencernaan.png"),
                        const Text(
                          "Masalah Pencernaan",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset("assets/images/kulit.png"),
                        const Text(
                          "Penyakit Kulit",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset("assets/images/tulang.png"),
                const Text(
                  "Tulang dan Sendi",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 97,
                  width: 250,
                  color: const Color.fromRGBO(255, 255, 255, 0.65),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "WARNING!!!",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 11, color: Colors.red),
                      ),
                      SizedBox(
                        height: 59,
                        width: 217,
                        child: Text(
                          warn,
                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 7),
                        ),
                      )
                    ],
                  ),
                )
              ],
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
