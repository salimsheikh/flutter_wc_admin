import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/base_page.dart';

class ProductsPage extends BasePage {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends BasePageState<ProductsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageTitle = "Products";
  }

  @override
  Widget pageUI() {
    return const Text("My Produst List page.");
  }
}
