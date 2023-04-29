import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/base_page.dart';

class DashboardPage extends BasePage {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends BasePageState<DashboardPage> {
  @override
  void initState() {
    super.initState();
    pageTitle = "Dashboard";
  }

  @override
  Widget pageUI() {
    return const Text("My Blank Dashboard");
  }
}
