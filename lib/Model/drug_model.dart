class DrugModel {
  String nama;
  int harga;
  String url;
  DrugModel({
    required this.nama,
    required this.harga,
    required this.url,
  });

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "harga": harga,
        "url": url,
      };

  static DrugModel fromJson(Map<String, dynamic> json) => DrugModel(
      nama: json["nama"],
      harga: json["harga"],
      url: json["url"], 
      );
}

class DrugOrderModel {
  String nama;
  int harga;
  String url;
  int totalProduk;
  DrugOrderModel({
    required this.nama,
    required this.harga,
    required this.url,
    required this.totalProduk
  });
  }