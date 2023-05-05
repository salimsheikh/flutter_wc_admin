// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/base_page.dart';
import 'package:flutter_wc_admin/pages/categories/category_add_edit.dart';
import 'package:flutter_wc_admin/provider/searchbar_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/list_helper.dart';

import '../../enum/page_type.dart';
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SearchBarUtils.searchBar(
              context,
              "strCategory",
              "Search Category",
              "Add Category",
              (searchText) {
                SortModel sortModel =
                    Provider.of<SearchBarProvider>(context, listen: false)
                        .sortModel;

                var categoriesProvider =
                    Provider.of<CategoriesProvider>(context, listen: false);

                categoriesProvider.resetStreams();

                categoriesProvider.fatchCategoreis(
                  sortBy: sortModel.sortColumnName,
                  sortOrder: sortModel.sortAscending ? 'asc' : 'desc',
                  strSearch: searchText,
                );
              },
              () {
                Get.to(() => const CategoryAddEditPage(pageType: PageType.add));
              },
            ),
          ),
          Divider(
            color: Theme.of(context).primaryColor,
          ),
          categoriesListUI(),
        ],
      ),
    );
  }

  Widget categoriesListUI() {
    return Consumer<CategoriesProvider>(
      builder: (context, model, child) {
        if (model.categoriesList.isNotEmpty) {
          return ListUtils.buildDataTable<CategoryModel>(
            context,
            ["Name", "Description", ""],
            ["name", "description", ""],
            Provider.of<SearchBarProvider>(context, listen: true)
                .sortModel
                .sortAscending,
            Provider.of<SearchBarProvider>(context, listen: true)
                .sortModel
                .sortColumnIndex,
            model.categoriesList,
            (CategoryModel onEditVal) {
              Get.to(() => CategoryAddEditPage(
                  pageType: PageType.edit, model: onEditVal));
            },
            (CategoryModel onDeleteTap) {
              //Provider.of<LoaderProvider>(context, listen: false).setLoadingStatus(true);

              Provider.of<CategoriesProvider>(context, listen: false)
                  .deleteCategory(
                onDeleteTap,
                (val) {
                  //Provider.of<LoaderProvider>(context, listen: false).setLoadingStatus(false);
                  if (val) {
                    Get.snackbar(
                      "Delete Category",
                      "Category deleted successfully",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 5),
                    );
                  } else {
                    Get.snackbar(
                      "Delete Category",
                      "Category deleted failed",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 5),
                    );
                  }
                },
              );
            },
            headingRowColor: Theme.of(context).primaryColor,
            onSort: (columnIndex, columnName, ascending) {
              Provider.of<SearchBarProvider>(context, listen: false)
                  .setSort(columnIndex, columnName, ascending);

              var categoriesProvider =
                  Provider.of<CategoriesProvider>(context, listen: false);
              categoriesProvider.resetStreams();
              categoriesProvider.fatchCategoreis(
                sortBy: columnName,
                sortOrder: ascending ? 'asc' : 'desc',
              );
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
