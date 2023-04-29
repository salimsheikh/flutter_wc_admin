List<OrderModel> ordersFromJson(dynamic str) =>
    List<OrderModel>.from((str).map((x) => OrderModel.fromJson(x)));

class OrderModel {
  late int orderId;
  late String status;
  late String orderNumber;
  late DateTime orderDate;

  OrderModel({
    required this.orderId,
    required this.status,
    required this.orderNumber,
    required this.orderDate,
  });

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['id'];
    status = json['status'];
    orderNumber = json['order_key'];
    orderDate = DateTime.parse(json['date_created']);
  }
}
