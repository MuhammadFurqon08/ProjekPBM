import 'package:apotek/Views/botnavbar_home/drugs_page.dart';
import 'package:apotek/Views/botnavbar_home/home_page.dart';
import 'package:apotek/Views/botnavbar_home/history_page.dart';
import 'package:apotek/Views/botnavbar_home/profile_page.dart';
import 'package:apotek/Views/botnavbar_home/shop_page.dart';
import 'package:flutter/material.dart';

class BotNavBar extends StatefulWidget {
  const BotNavBar({super.key});

  @override
  State<BotNavBar> createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int index = 0;
  final screen = [const HomePage(), const DrugsPage(), const ShopPage(), const HistoryPage(), const ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF5CAAF2),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Color.fromRGBO(0, 0, 0, 0.29),
              ),
              label: "Home",
              icon: Icon(
                Icons.home,
                color: Colors.black,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.search,
                color: Color.fromRGBO(0, 0, 0, 0.29),
              ),
              label: "Search",
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.shopping_cart,
                color: Color.fromRGBO(0, 0, 0, 0.29),
              ),
              label: "Shopping",
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.compare_arrows,
                color: Color.fromRGBO(0, 0, 0, 0.29),
              ),
              label: "Activities",
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.black,
              )),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person_pin,
                color: Color.fromRGBO(0, 0, 0, 0.29),
              ),
              label: "Profile",
              icon: Icon(
                Icons.person_pin,
                color: Colors.black,
              )),
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      body: screen[index],
    );
  }
}
