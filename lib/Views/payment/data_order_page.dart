import 'package:apotek/Model/order_model.dart';
import 'package:apotek/Provider/drug_provider.dart';
import 'package:apotek/Views/payment/detail_order_page.dart';
import 'package:apotek/Widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'maps_page.dart';

class DataOrderPage extends StatelessWidget {
  DataOrderPage({super.key});
  final controlName = TextEditingController();
  final controlPhone = TextEditingController();
  final controlAddress = TextEditingController();
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
        title: Text("Detail Pengiriman"),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.centerRight,
        height: 55,
        color: Color(0xFF5CAAF2),
        // width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            onPressed: () {
              final data = OrderDetail(name: controlName.text, phone: controlPhone.text, address: controlAddress.text);
              Provider.of<DrugProvider>(context, listen: false).addOrder(data); 
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailOrder(),
                  ));
            },
            style: ElevatedButton.styleFrom(elevation: 0, minimumSize: Size(165, 55), textStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 12), backgroundColor: Color(0xFF26BBFB)),
            child: Text("Simpan")),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          Field(
            controller: controlName,
            validator: (value) {
              if (value!.isEmpty) {
                return ("please fill field");
              } else {
                return null;
              }
            },
            hintText: "Nama Penerima: ",
          ),
          SizedBox(
            height: 10,
          ),
          Field(
            controller: controlPhone,
            validator: (value) {
              if (value!.isEmpty) {
                return ("please fill field");
              } else {
                return null;
              }
            },
            hintText: "No. Telepon: ",
          ),
          SizedBox(
            height: 10,
          ),
          Field(
            controller: controlAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return ("please fill field");
              } else {
                return null;
              }
            },
            hintText: "Detail Alamat: ",
            maxLines: 4,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              icon: Icon(Icons.map),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage(),));
              },
              style: ElevatedButton.styleFrom(
                textStyle: GoogleFonts.roboto(textStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, color: Colors.white)),
                minimumSize: const Size(188, 43),
                backgroundColor: const Color(0xFF6FE5FF),
              ),
              label: Text("Pilih Lewat Peta"),
            ),
          )
        ],
      ),
    );
  }
}
