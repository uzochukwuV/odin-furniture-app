import 'package:flutter/material.dart';
import 'package:odin/constants/app_theme.dart';
import 'package:odin/screens/cart/page.dart';
import 'package:odin/screens/favorite/page.dart';
import 'package:odin/screens/home/home.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _currentPage = 0;

  void toCart() {
    setState(() {
      _currentPage = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomeScreen(
        tocart: toCart,
      ),
      FavoritePage(),
      CartPage(),
      Container()
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: pages[_currentPage]),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 1,
          iconSize: 32,
          selectedItemColor: AppTheme.primary,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _currentPage,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              _currentPage = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: "Home",
                activeIcon: Icon(
                  Icons.home_filled,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_outline,
                ),
                label: "Saved",
                activeIcon: Icon(
                  Icons.bookmark_outline_sharp,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications_outlined,
                ),
                label: "Notifications",
                activeIcon: Icon(
                  Icons.notifications_active,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outlined,
                ),
                label: "You",
                activeIcon: Icon(
                  Icons.person_2,
                ))
          ]),
    );
  }
}
