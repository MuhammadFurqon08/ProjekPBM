import 'package:apotek/Provider/drug_provider.dart';
import 'package:apotek/Views/payment/drug_detail_page.dart';
import 'package:apotek/model/drug_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Model/account_model.dart';
import '../../Widgets/bot_nav_bar_drug_detail.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<DrugModel>>(
          stream: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Provider.of<DrugProvider>(context, listen: false).setDetailDrug(data[index]);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DrugDetailPage(),
                          ));
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Image(
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
                            image: NetworkImage(data[index].url)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          data[index].nama,
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                        ),
                        Text(
                          "Rp. ${data[index].harga}",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
                        ),
                        SizedBox(
                          height: 30,
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

Stream<List<DrugModel>> getData() => FirebaseFirestore.instance.collection("Obat").snapshots().map((snapshots) => snapshots.docs.map((e) => DrugModel.fromJson(e.data())).toList());
