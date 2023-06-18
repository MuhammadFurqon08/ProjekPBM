// import 'package:apotek/Views/payment/chart_page.dart';
// import 'package:apotek/Views/payment/detail_order_page.dart';
// import 'package:flutter/material.dart';

// import '../Views/payment/drug_detail_page.dart';

// class BotNavBarDetailDrug extends StatefulWidget {
//   const BotNavBarDetailDrug({super.key});

//   @override
//   State<BotNavBarDetailDrug> createState() => _BotNavBarDetailDrugState();
// }

// class _BotNavBarDetailDrugState extends State<BotNavBarDetailDrug> {
//   int index = 0;
//   final screen = [const DrugDetailPage(), const ChartPage()];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         height: 55,
//         color: Color(0xFF5CAAF2),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             InkWell(
//               onTap: () {
//                 setState(() {
//                   index = 0;
//                 });
//               },
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 10),
//                 child: Icon(Icons.check_box_outline_blank),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: VerticalDivider(
//                 thickness: 2,
//                 color: Colors.black,
//               ),
//             ),
//             IconButton(
//                 onPressed: () {
//                   setState(() {
//                     index = 1;
//                   });
//                 },
//                 icon: Icon(Icons.shopping_cart)),
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 padding: EdgeInsets.only(left: 20),
//                 width: 100,
//                 alignment: Alignment.center,
//                 color: Color(0xFF26BBFB),
//                 child: Text(
//                   "Masukkan Keranjang",
//                   overflow: TextOverflow.clip,
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => DetailOrder(),
//                     ));
//               },
//               child: Container(
//                 width: 100,
//                 alignment: Alignment.center,
//                 color: Color(0xFF26BBFB),
//                 child: Text(
//                   "Beli Sekarang",
//                   style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       body: screen[index],
//     );
//   }
// }
