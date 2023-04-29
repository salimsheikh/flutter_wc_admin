import 'package:flutter_wc_admin/models/order_model.dart';
import 'package:flutter_wc_admin/services/api_services.dart';

class OrderPrivider {
  late APIServices apiServicesPrivate;

  late List<OrderModel> ordersListPrivate;
  List<OrderModel> get ordersList => ordersListPrivate;

  orderProvider() {
    apiServicesPrivate = APIServices();
    ordersListPrivate = [];
  }

  fetchOrders() async {
    //List<OrderModel> ordersList = await apiServicesPrivate.getOrders();

    List<OrderModel> ordersList = List<OrderModel>.empty(growable: true);

    var tempList = await apiServicesPrivate.getOrders();

    if (tempList != null) {
      ordersList = tempList;
    }

    // ignore: unnecessary_null_comparison
    if (ordersList == null) {
      ordersListPrivate = List<OrderModel>.empty(growable: true);
    }
    if (ordersList.isNotEmpty) {
      ordersListPrivate = [];
      ordersListPrivate.addAll(ordersList);
    }
  }
}
