import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/models/settigns_model.dart';
import 'package:flutter_wc_admin/services/api_services.dart';

class LoginProvider with ChangeNotifier {
  late bool protectedHidePassword;
  bool get hidePassword => protectedHidePassword;

  late SettingModel protectedSetingModel;
  SettingModel get settingModel => protectedSetingModel;

  late APIServices protectedAPIServices;

  late bool protectedIsLoading;
  bool get isloading => protectedIsLoading;

  late String protectedMessage;
  String get message => protectedMessage;

  late String protectedToken;
  String get token => protectedToken;

  LoginProvider() {
    protectedHidePassword = true;
    protectedSetingModel = SettingModel();
    protectedAPIServices = APIServices();
    protectedIsLoading = false;
    protectedMessage = "";
  }

  onShowHidePassword() {
    protectedHidePassword = !protectedHidePassword;
    notifyListeners();
  }
}
