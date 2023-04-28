import 'dart:convert';

import 'package:flutter_wc_admin/models/login_model.dart';
import 'package:flutter_wc_admin/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SharedServices {
  static Future<void> setLoginDetails(
    LoginModel model,
  ) async {
    final pref = await SharedPreferences.getInstance();

    if (model != null) {
      final loginSring = jsonEncode(model);
      pref.setString("login_details", loginSring);
    } else {
      pref.setString("login_details", '');
    }
  }

  static Future<bool> isLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    final ld = pref.getString("login_details");

    if (ld != "null" && ld != null) {
      return true;
    }
    return false;
  }

  static Future<LoginModel> loginDetails() async {
    final pref = await SharedPreferences.getInstance();

    final ld = pref.getString("login_details");

    // if (ld != "null" && ld != null) {
    return LoginModel.fromJson(jsonDecode(ld.toString()));
    //}
    //return false;
  }

  static Future<void> logout() async {
    //await setLoginDetails(null);
    final pref = await SharedPreferences.getInstance();
    pref.setString("login_details", 'null');
    Get.offAll(() => const LoginPage());
  }
}
