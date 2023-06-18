import 'package:apotek/Provider/drug_provider.dart';
import 'package:apotek/Views/payment/data_order_page.dart';
import 'package:apotek/Widgets/bot_nav_bar.dart';
import 'package:apotek/model/drug_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chart_page.dart';
import 'detail_order_page.dart';

class DrugDetailPage extends StatefulWidget {
  const DrugDetailPage({super.key});

  @override
  State<DrugDetailPage> createState() => _DrugDetailPageState();
}

int produkCount = 1;

class _DrugDetailPageState extends State<DrugDetailPage> {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DrugProvider>(context, listen: false).getDrug;
    const desc = "PARACETAMOL TABLET merupakan obat yang dapat digunakan untuk meringankan rasa sakit pada sakit kepala, sakit gigi, dan menurunkan demam. Paracetamol bekerja pada pusat pengatur suhu di hipotalamus untuk menurunkan suhu tubuh (antipiretik) serta menghambat sintesis prostaglandin sehingga dapat mengurangi nyeri ringan sampai sedang (analgesik).";
    const dosis = "Dewasa: 1-2 kaplet, 3-4 kali per hari. Penggunaan maximum 8 kaplet per hari. Anak 7-12 tahun : 0.5 - 1 kaplet, 3-4 kali per hari. Penggunaan maximum 4 kaplet per hari. \nObat dapat diminum sebelum atau sesudah makan";
    const efek = """
efek samping yang dapat terjadi berupa reaksi alergi, seperti:
- Gatal-gatal.
- Sulit bernapas.
- Pembengkakan pada wajah, bibir, lidah, atau tenggorokan.
-Demam yang disertai mual, sakit perut, dan kehilangan nafsu makan.
-Urine berwarna gelap.
-Tinja tampak seperti tanah liat atau berwarna gelap.
- Mengalami penyakit kuning atau kulit dan mata terlihat menguning.

""";
    return Scaffold(
      bottomNavigationBar: Container(
        height: 55,
        color: Color(0xFF5CAAF2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChartPage(),
                      ));
                },
                icon: Icon(Icons.shopping_cart)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: () {

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => ChartPage(),
                //     ));
              },
              child: Container(
                padding: EdgeInsets.only(left: 20),
                width: 100,
                alignment: Alignment.center,
                color: Color(0xFF26BBFB),
                child: Text(
                  "Masukkan Keranjang",
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                final data = DrugOrderModel(nama: dataProvider.nama, harga: dataProvider.harga, url: dataProvider.url, totalProduk: produkCount);
                Provider.of<DrugProvider>(context, listen: false).setDetailDrugOrder(data);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DataOrderPage(),
                    ));
              },
              child: Container(
                width: 100,
                alignment: Alignment.center,
                color: Color(0xFF26BBFB),
                child: Text(
                  "Beli Sekarang",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BotNavBar(),
                  ));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Image.network(dataProvider.url),
          ),
          const SizedBox(
            height: 19,
          ),
          Text(
            dataProvider.nama,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          Text("${dataProvider.harga}"),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      produkCount -= 1;
                    });
                  },
                  icon: Icon(Icons.remove)),
              Text("$produkCount"),
              IconButton(
                  onPressed: () {
                    setState(() {
                      produkCount += 1;
                    });
                  },
                  icon: Icon(
                    Icons.add,
                  )),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Kegunaan Obat",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          const Text(
            desc,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Dosis dan Aturan Pakai Obat",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          const Text(
            dosis,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Efek Samping Obat",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          const Text(
            efek,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
