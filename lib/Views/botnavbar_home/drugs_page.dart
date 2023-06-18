import 'package:flutter/material.dart';

class DrugsPage extends StatelessWidget {
  const DrugsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 46),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              onChanged: (value) {},
              decoration: const InputDecoration(border: InputBorder.none, filled: true, fillColor: Colors.white, prefixIcon: Icon(Icons.search), prefixIconColor: Color.fromRGBO(6, 6, 6, 0.38), hintText: "find the name of the drug ...", hintStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, color: Color.fromRGBO(6, 6, 6, 0.38))),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: ListTile(
              leading: Image.asset("assets/images/batuk.png"),
              title: const Text(
                "Batuk, Pilek, & Flu",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black),
              ),
              trailing: Container(
                padding: const EdgeInsets.only(top: 30),
                width: 102,
                child: const Text(
                  "-> Nasal Spray dan Deskongestan",
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 11, color: Colors.black),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "-> Batuk & Flu",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                  Text(
                    "-> Perawatan Herbal",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: ListTile(
              leading: Image.asset("assets/images/alergi.png"),
              title: const Text(
                "Alergi",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "-> Obat Alergi",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                  Text(
                    "-> Pereda Gatal",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: ListTile(
              leading: Image.asset("assets/images/pencernaan.png"),
              title: const Text(
                "Masalah Pencernaan",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black),
              ),
              trailing: Container(
                width: 102,
                padding: const EdgeInsets.only(top: 24),
                child: const Text(
                  "-> Diare",
                  style: TextStyle(fontSize: 11, color: Colors.black),
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "-> Asam Lambung & GERD",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                  Text(
                    "-> Mual, Muntah",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: ListTile(
              leading: Image.asset("assets/images/kulit.png"),
              title: const Text(
                "Penyakit Kulit",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "-> Jerawat",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                  Text(
                    "-> Infeksi Kulit",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 25),
            child: ListTile(
              leading: Image.asset("assets/images/tulang.png"),
              title: const Text(
                "Tulang dan Sendi",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "-> Asam Urat dan Radang Sendi",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                  Text(
                    "-> Tulang dan Osteoporosis",
                    style: TextStyle(fontSize: 11, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
