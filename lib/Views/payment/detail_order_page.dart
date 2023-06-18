import 'package:apotek/Model/order_model.dart';
import 'package:apotek/Provider/drug_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailOrder extends StatefulWidget {
  const DetailOrder({super.key});

  @override
  State<DetailOrder> createState() => _DetailOrderState();
}

bool isOrder = false;

class _DetailOrderState extends State<DetailOrder> {
  @override
  Widget build(BuildContext context) {
    final dataOrder = Provider.of<DrugProvider>(context, listen: false).getOrderDetail;
    final dataDrug = Provider.of<DrugProvider>(context, listen: false).getDrugOrder;

    final subTotal = dataDrug.harga * dataDrug.totalProduk;
    const ongkir = 5000;
    return Scaffold(
      bottomNavigationBar: Container(
        alignment: Alignment.centerRight,
        height: 55,
        color: Color(0xFF5CAAF2),
        // width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
              if (isOrder == false) {
                try {
                  final data = OrderModel(
                    totalPesanan: dataDrug.totalProduk, 
                    metodePembayaran: "COD", 
                    subtotal: subTotal, 
                    pengiriman: ongkir, 
                    total: subTotal+ongkir, 
                    thumbnail: dataDrug.url, 
                    nameDrug: dataDrug.nama, 
                    name: dataOrder.name, 
                    address: dataOrder.address, 
                    phone: dataOrder.phone,
                    harga: dataDrug.harga);
                  Provider.of<DrugProvider>(context, listen: false).orderDrug(data);
                }on FirebaseAuthException catch (e) {
                  print(e);
                }
              }
              setState(() {
                isOrder = !isOrder;
              });
            },
            style: ElevatedButton.styleFrom(elevation: 0, minimumSize: Size(165, 55), textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12), backgroundColor: isOrder ? Colors.red : Color(0xFF26BBFB)),
            child: isOrder ? Text("Batalkan Pesanan") : Text("Buat Pesanan")),
      ),
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: isOrder ? Text("Rincian Pesanan") : Text("Pembayaran"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Alamat Pengiriman",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 11),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(child: Text("${dataOrder.name}, ${dataOrder.phone}")),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(width: MediaQuery.of(context).size.width, child: Text(dataOrder.address)),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  dataDrug.url,
                  height: 94,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  dataDrug.nama,
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Pesanan (${dataDrug.totalProduk} produk)"),
                Text("${dataDrug.harga}"),
              ],
            ),
          ),
          const Divider(color: Colors.black),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(child: Text("Metode Pembayaran")),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(child: Text("COD (Cash on delivery)")),
          ),
          const Divider(color: Colors.black),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(alignment: Alignment.center, child: const Text("Rincian Pesanan")),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal untuk Produk"),
                Text("$subTotal"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Subtotal Pengiriman"),
                const Text("$ongkir"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total Pembayaran"),
                Text("${subTotal+ongkir}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
