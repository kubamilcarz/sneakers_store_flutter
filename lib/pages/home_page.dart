import 'package:flutter/material.dart';
import 'package:nike_shoes/components/bottom_nav_bar.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(Icons.menu, color: Colors.black),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                  child: Image.asset("assets/images/nike_logo.png",
                      color: Colors.white),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text("Home",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: const Icon(Icons.info, color: Colors.white),
                    title: const Text("About",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text("Log out",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
