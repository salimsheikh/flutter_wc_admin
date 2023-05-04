import 'package:flutter/material.dart';

class LoaderProvider with ChangeNotifier {
  bool privateIsAPICallProcess = false;
  bool get isAPICallProcess => privateIsAPICallProcess;

  setLoadingStatus(bool status) {
    privateIsAPICallProcess = status;
    notifyListeners();
  }
}
