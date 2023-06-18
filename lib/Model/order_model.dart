class OrderModel {
  String id;
  int totalPesanan;
  String metodePembayaran;
  int subtotal;
  int pengiriman;
  int total;
  String thumbnail;
  String nameDrug;
  String name;
  String address;
  String phone;
  int harga;
  OrderModel({
    this.id = '',
    required this.totalPesanan,
    required this.metodePembayaran,
    required this.subtotal,
    required this.pengiriman,
    required this.total,
    required this.thumbnail,
    required this.nameDrug,
    required this.name,
    required this.address,
    required this.phone,
    required this.harga,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "totalPesanan": totalPesanan,
        "metodePembayaran": metodePembayaran,
        "subtotal": subtotal,
        "pengiriman" : pengiriman,
        "total" : total,
        "thumbnail" : thumbnail,
        "nameDrug" : nameDrug,
        "name" : name,
        "address" : address,
        "phone" : phone,
        "harga" : harga,
      };

  static OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
      id: json["id"],
      totalPesanan: json["totalPesanan"],
      metodePembayaran: json["metodePembayaran"],
      subtotal: json["subtotal"], 
      pengiriman: json['pengiriman'],
      total: json['total'],
      thumbnail: json["thumbnail"] ,
      nameDrug: json["nameDrug"] ,
      name: json["name"] ,
      address: json["address"] ,
      phone: json["phone"] ,
      harga: json["harga"] ,
      );
}


class OrderDetail{
  String name;
  String phone;
  String address;

  OrderDetail({
    required this.name,
    required this.phone,
    required this.address,
  });
}