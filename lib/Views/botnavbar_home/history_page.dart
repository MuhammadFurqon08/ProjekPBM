import 'package:apotek/Model/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Riwayat Pembelian"),
      ),
      body: StreamBuilder<List<OrderModel>>(
          stream: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data[index].thumbnail,
                                height: 94,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                data[index].nameDrug,
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
                              Text("Total Pesanan (${data[index].totalPesanan} produk)"),
                              Text("Rp. ${data[index].harga}"),
                            ],
                          ),
                        ),
                        const Divider(color: Colors.black),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Metode Pembayaran"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(data[index].metodePembayaran),
                        ),
                        const Divider(color: Colors.black),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: const Text("Rincian Pesanan"),
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
                              Text("Rp. ${data[index].subtotal}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Subtotal Pengiriman"),
                              Text("Rp. ${data[index].pengiriman}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total Pembayaran"),
                              Text("Rp.${data[index].total}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Container();
          }),
    );
  }
}

Stream<List<OrderModel>> getData() => FirebaseFirestore.instance.collection("Orders").snapshots().map((snapshots) => snapshots.docs.map((e) => OrderModel.fromJson(e.data())).toList());
