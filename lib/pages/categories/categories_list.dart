import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/base_page.dart';

class CategoriesList extends BasePage {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends BasePageState<CategoriesList> {
  @override
  void initState() {
    super.initState();
    pageTitle = "Category";
  }

  @override
  Widget pageUI() {
    return const Text("Category 2");
  }
}
