import 'package:apotek/Model/account_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final AccountsModel _profile = AccountsModel(nama: "", email: "", password: "", dateBirth: "", phone: "", username: "");
  AccountsModel get getProfile => _profile;

  Future<void> registerAccount(AccountsModel dataAccount) async {
    final docData = FirebaseFirestore.instance.collection("Accounts").doc();
    dataAccount.id = docData.id;
    final json = dataAccount.toJson();
    docData.set(json);
    notifyListeners();
  }

  Future<void> setAccount(AccountsModel data)async{
    _profile.nama = data.nama;
    _profile.email = data.email;
    _profile.dateBirth = data.dateBirth;
    _profile.phone = data.phone;
    _profile.password = data.password;
    _profile.username = data.username;
    _profile.id = data.id;
  }

  Future<void> editProfile(AccountsModel data) async {
    final docData = FirebaseFirestore.instance.collection("Accounts").doc(data.id);
    data.id = docData.id;
    final json = data.toJson();
    docData.update(json);
    notifyListeners();
  }
  // Future<void> setAllProfile() async {
  //   final data = FirebaseFirestore.instance.collection("Accounts").where("email", isEqualTo: FirebaseAuth.instance.currentUser!.email).snapshots().map((snapshots) => snapshots.docs.map((e) => AccountsModel.fromJson(e.data())).toList());
  //   data.forEach((element) {
  //     _profile = element;
  //   });
    // for (var element in dataJSON) {
    //   _profile.nama = element.nama;
    //   _profile.email = element.email;
    //   _profile.password = element.password;
    //   _profile.dateBirth = element.dateBirth;
    //   _profile.phone = element.phone;
    //   _profile.username = element.username;
    // }
  // }
}
