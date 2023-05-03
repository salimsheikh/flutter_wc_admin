import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/base_page.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/list_helper.dart';

import '../../models/category_model.dart';
import '../../provider/categories_provider.dart';
import '../utils/searchbar_utils.dart';

class CategoriesList extends BasePage {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends BasePageState<CategoriesList> {
  //List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    pageTitle = "Category";
    //categories = List<CategoryModel>.empty(growable: true);
    /*
    categories.add(CategoryModel(
        id: 1,
        name: 'Baby Care',
        parent: 0,
        description: 'Baby Care products',
        image: ''));
    categories.add(CategoryModel(
        id: 2,
        name: 'Grocery',
        parent: 0,
        description: 'Grocery Products',
        image: ''));
    categories.add(CategoryModel(
        id: 3,
        name: 'Baby Care 3',
        parent: 0,
        description: 'Some text',
        image: ''));

        */

    var categoryProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    categoryProvider.fatchCategoreis();
  }

  @override
  Widget pageUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SearchBarUtils.searchBar(
            context,
            "searchCategory",
            "Search Category",
            "Add Category",
            () {},
            () {},
          ),
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        categoriesListUI(),
      ],
    );
  }

  Widget categoriesListUI() {
    return Consumer<CategoriesProvider>(
      builder: (context, model, child) {
        if (model.categoriesList.isNotEmpty) {
          return ListUtils.buildDataTable<CategoryModel>(
            context,
            ["name", "Description", ""],
            ["name", "description", ""],
            true,
            0,
            model.categoriesList,
            (CategoryModel onEditVal) {
              //print(onEditVal.id);
              //print(onEditVal.name);
            },
            (CategoryModel onDeleteTap) {
              //print(onDeleteTap.id);
              //print(onDeleteTap.name);
            },
            headingRowColor: Theme.of(context).primaryColor,
            onSort: () {
              return true;
            },
            headingRowHeight: 50,
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
