import 'package:flutter_wc_admin/models/login_model.dart';
import 'package:flutter_wc_admin/services/shared_services.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static var client = http.Client();

  static Future<bool> checkLogin(
    LoginModel model,
  ) async {
    String siteURL = "demos.infosofttech.com";

    Map<String, String> requestHeaders = {'Content-Type': "application/json"};

    var url = Uri.http(siteURL, "/wp-json/wc/v3/products",
        {"consumer_key": model.key, "consumer_secret": model.secret});

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      await SharedServices.setLoginDetails(model);
      return true;
    }

    return false;
  }
}
