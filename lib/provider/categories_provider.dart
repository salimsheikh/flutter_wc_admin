import 'package:flutter/cupertino.dart';
import 'package:flutter_wc_admin/models/category_model.dart';
import 'package:flutter_wc_admin/services/api_services.dart';

class CategoriesProvider with ChangeNotifier {
  late APIServices privateAPIServices;

  late List<CategoryModel> privateCategoriesList;
  List<CategoryModel> get CategoriesList => privateCategoriesList;

  double get totalCategoryRecords => privateCategoriesList.length.toDouble();

  CategoriesProvider() {
    privateAPIServices = APIServices();
    privateCategoriesList = []; /*null */
  }

  resetStreams() {
    privateAPIServices = APIServices();
    privateCategoriesList = []; /*null */

    notifyListeners();
  }

  fatchCategoreis({
    String strSearch = '',
    String sortBy = '',
    String sortOrder = '',
  }) async {
/*
    List<CategoryModel> categoriesList(){

    }
*/
  }
}
