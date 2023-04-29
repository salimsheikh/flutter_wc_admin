import 'package:flutter/material.dart';
import '../services/shared_services.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  String pageTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: pageUI(),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
        title: Text(pageTitle),
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              onPressed: () async {
                await SharedServices.logout();
              },
              icon: const Icon(Icons.logout, color: Colors.black)),
          const SizedBox(width: 10)
        ]);
  }

  Widget pageUI() {
    return const Text("BasePage");
  }

  @override
  void dispose() {
    super.dispose();
  }
}
