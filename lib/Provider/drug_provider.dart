import 'package:apotek/Model/account_model.dart';
import 'package:apotek/Model/order_model.dart';
import 'package:apotek/model/drug_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DrugProvider with ChangeNotifier {
  final DrugModel _drug = DrugModel(nama: "", harga: 0, url: "");
  DrugModel get getDrug => _drug;

  final OrderDetail _orderDetail = OrderDetail(name: "", phone: "", address: "");
  OrderDetail get getOrderDetail => _orderDetail;

  final DrugOrderModel _drugOrder = DrugOrderModel(nama: "", harga: 0, url: "", totalProduk: 0);
  DrugOrderModel get getDrugOrder => _drugOrder;

  Future<void> setDetailDrug(DrugModel dataDrug) async {
    _drug.nama = dataDrug.nama;
    _drug.harga = dataDrug.harga;
    _drug.url = dataDrug.url;
    notifyListeners();
  }

  Future<void> addOrder(OrderDetail orderDetail) async {
    _orderDetail.name = orderDetail.name;
    _orderDetail.phone = orderDetail.phone;
    _orderDetail.address = orderDetail.address;
    notifyListeners();
  }

  Future<void> setDetailDrugOrder(DrugOrderModel dataDrug) async {
    _drugOrder.nama = dataDrug.nama;
    _drugOrder.harga = dataDrug.harga;
    _drugOrder.url = dataDrug.url;
    _drugOrder.totalProduk = dataDrug.totalProduk;
    notifyListeners();
  }

  Future<void> orderDrug(OrderModel order) async {
    final docData = FirebaseFirestore.instance.collection("Orders").doc();
    order.id = docData.id;
    final json = order.toJson();
    docData.set(json);
    notifyListeners();
  }

}
