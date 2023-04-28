import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/services/shared_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: const Center(child: Text("Dashboard")),
    );
  }
}
