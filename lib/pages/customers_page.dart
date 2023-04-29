import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/base_page.dart';

class CustomersPage extends BasePage {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends BasePageState<CustomersPage> {
  @override
  void initState() {
    super.initState();
    pageTitle = "Customers";
  }

  @override
  Widget pageUI() {
    return const Text("My Comtomer List page.");
  }
}
