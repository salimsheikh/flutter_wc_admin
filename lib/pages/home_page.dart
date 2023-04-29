// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_wc_admin/services/shared_services.dart';

class NavBarModel {
  String title;
  IconData icon;
  String color;
  NavBarModel({
    required this.title,
    required this.icon,
    required this.color,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NavBarModel> titleList = [
    NavBarModel(title: "Dashboard", icon: Icons.home, color: "#0088EO"),
    NavBarModel(title: "Category", icon: Icons.category, color: "#A50606"),
    NavBarModel(title: "Prodcuts", icon: Icons.image, color: "#6D7600"),
    NavBarModel(title: "Customers", icon: Icons.group, color: "#450FE0"),
    NavBarModel(title: "Ordres", icon: Icons.shopping_basket, color: "#E644CA"),
  ];
  int selectedNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashbord"),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                await SharedServices.logout();
              },
              icon: const Icon(Icons.logout, color: Colors.black))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedNavIndex,
        onTap: (index) {
          setState(() {
            selectedNavIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              label: "Dashbaord"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                color: Colors.blue,
              ),
              label: "Category"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.image,
                color: Colors.blue,
              ),
              label: "Products"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
                color: Colors.blue,
              ),
              label: "Customer"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket,
                color: Colors.blue,
              ),
              label: "Ordres")
        ],
      ),
      body: const Center(child: Text("Dashboard")),
    );
  }
}

//Use HexColor.fromHex('#0088EO')
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
