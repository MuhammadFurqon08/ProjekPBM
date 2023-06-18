class AccountsModel {
  String id;
  String nama;
  String email;
  String password;
  String dateBirth;
  String phone;
  String username;
  AccountsModel({
    this.id = '',
    required this.nama,
    required this.email,
    required this.password,
    required this.dateBirth,
    required this.phone,
    required this.username,
  });

  Map<String, dynamic> toJson() => {"id": id, "nama": nama, "email": email, "password": password, "dateBirth": dateBirth, "phone": phone, "username": username};

  static AccountsModel fromJson(Map<String, dynamic> json) => AccountsModel(id: json["id"], nama: json["nama"], email: json["email"], password: json["password"], dateBirth: json['dateBirth'], phone: json['phone'], username: json['username']);
}
