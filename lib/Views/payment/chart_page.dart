import 'package:apotek/Views/payment/detail_order_page.dart';
import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({super.key});

  @override
  State<ChartPage> createState() => _ChartPageState();
}

int produkCount = 0;
bool? isCheck = false;

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text("Keranjang Saya"),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.centerRight,
        height: 55,
        color: Color(0xFF5CAAF2),
        // width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailOrder(),
                  ));
            },
            style: ElevatedButton.styleFrom(elevation: 0, minimumSize: Size(165, 55), textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12), backgroundColor: Color(0xFF26BBFB)),
            child: Text("Checkout Pesanan")),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Colors.blue,
                  tristate: true,
                  value: isCheck,
                  onChanged: (value) {
                    setState(() {
                      isCheck = value;
                    });
                  },
                ),
                Image.asset("assets/images/procold.png"),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200,
                      child: const Text(
                        "Procold Flu Dan Batuk 6 Kaplet",
                        overflow: TextOverflow.clip,
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    const Text("Rp2.700 - Rp4.500"),
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
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
