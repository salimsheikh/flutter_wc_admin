// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_wc_admin/models/category_model.dart';
import 'package:flutter_wc_admin/models/login_model.dart';
import 'package:flutter_wc_admin/services/shared_services.dart';
import 'package:http/http.dart' as http;

import '../models/order_model.dart';

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

/*
? added for retun null value;
*/
  Future<List<OrderModel>?> getOrders() async {
    Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

    var loginDetails = await SharedServices.loginDetails();

    Map<String, String> queryString = {
      'consumer_key': loginDetails.key,
      'consumer_secret': loginDetails.secret
    };

    var url =
        Uri.https(loginDetails.host, '/wp-json/wc/v3/orders', queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return ordersFromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<List<CategoryModel>> getCategories({
    String strSearch = '',
    String sortBy = '',
    String sortOrder = 'asc',
    bool parentCategories = true,
  }) async {
    //List<CategoryModel>

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var loginDetails = await SharedServices.loginDetails();

    Map<String, String> queryString = {
      'consumer_key': loginDetails.key,
      'consumer_secret': loginDetails.secret,
    };

    if (strSearch != "") {
      queryString['search'] = strSearch;
    }

    if (parentCategories) {
      queryString['parent'] = '0';
    }

    if (sortBy != "") {
      queryString['orderby'] = sortBy;
    }

    if (sortOrder != "") {
      queryString['order'] = sortOrder;
    }

    var url = Uri.http(
        loginDetails.host, '/wp-json/wc/v3/products/categories', queryString);

    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      return categoriesFromJson(json.decode(response.body));
    } else {
      return [];
    }
  }

  Future<CategoryModel> createCategory(CategoryModel model) async {
    var loginDetails = await SharedServices.loginDetails();

    var authToken = base64
        .encode(utf8.encode("${loginDetails.key}:${loginDetails.secret}"));

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'authorization': 'Basic $authToken',
    };

    Map<String, dynamic> bodyJason = {
      'id': 0,
      'name': model.name,
      'description': model.description,
    };

    var url =
        Uri.https(loginDetails.host, '/wp-json/wc/v3/products/categories');

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: jsonEncode(bodyJason),
    );

    if (response.statusCode == 201) {
      var newModel = categoryFromJson(response.body);
      newModel.success = true;
      return newModel;
    } else {
      model.success = false;
      return model;
    }
  }

  Future<CategoryModel> updateCategory(CategoryModel model) async {
    var loginDetails = await SharedServices.loginDetails();

    var authToken = base64
        .encode(utf8.encode("${loginDetails.key}:${loginDetails.secret}"));

    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
      'authorization': 'Basic $authToken',
    };

    String catId = model.id.toString();

    var url = Uri.https(
      loginDetails.host,
      '/wp-json/wc/v3/products/categories/$catId',
    );

    var response = await client.put(
      url,
      headers: requestHeaders,
      body: jsonEncode(
        model.toJson(),
      ),
    );

    if (response.statusCode == 201) {
      var newModel = categoryFromJson(response.body);
      newModel.success = true;
      return newModel;
    } else {
      model.success = false;
      return model;
    }
  }

  Future<bool> deleteCategory(CategoryModel model) async {
    var loginDetails = await SharedServices.loginDetails();

    var authToken = base64
        .encode(utf8.encode("${loginDetails.key}:${loginDetails.secret}"));

    Map<String, String> requestHeaders = {
      'authorization': 'Basic $authToken',
    };

    String catId = model.id.toString();

    var url = Uri.https(
      loginDetails.host,
      '/wp-json/wc/v3/products/categories/$catId',
      {'force': "true"},
    );

    var response = await client.delete(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}/*End Class */