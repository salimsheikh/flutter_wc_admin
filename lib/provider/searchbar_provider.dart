import 'package:flutter/widgets.dart';

class SortModel {
  int sortColumnIndex = 0;
  String sortColumnName = '';
  bool sortAscending = false;

  SortModel({
    required this.sortColumnIndex,
    required this.sortColumnName,
    required this.sortAscending,
  });
}

class SearchBarProvider with ChangeNotifier {
  late SortModel privateSortModel;
  SortModel get sortModel => privateSortModel;

  SearchBarProvider() {
    privateSortModel =
        SortModel(sortColumnIndex: 0, sortColumnName: '', sortAscending: false);
    privateSortModel.sortColumnIndex = 0;
    privateSortModel.sortAscending = false;
  }

  setSort(
    int columnIndex,
    String sortColumnName,
    bool ascending,
  ) {
    privateSortModel.sortAscending = ascending;
    privateSortModel.sortColumnIndex = columnIndex;
    privateSortModel.sortColumnName = sortColumnName;

    notifyListeners();
  }
}
