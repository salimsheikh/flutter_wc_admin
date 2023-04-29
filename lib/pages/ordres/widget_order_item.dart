import 'package:flutter/material.dart';

import 'package:flutter_wc_admin/models/order_model.dart';

class WidgetOrderItem extends StatelessWidget {
  final OrderModel orderModel;

  const WidgetOrderItem({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          orderStatus(orderModel.status),
          const Divider(color: Colors.grey),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("OrderID"),
              Text(orderModel.orderId.toString()),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Order Date"),
              Text(orderModel.orderDate.toString()),
            ],
          )
        ],
      ),
    );
  }

  Widget orderStatus(String status) {
    Icon icon;
    Color color;

    if (status == 'pending' || status == 'processing' || status == 'on-hold') {
      icon = const Icon(
        Icons.timer,
        color: Colors.orange,
      );
      color = Colors.orange;
    } else if (status == 'completed') {
      icon = const Icon(
        Icons.clear,
        color: Colors.green,
      );
      color = Colors.green;
    } else if (status == 'canclled' ||
        status == 'refunded' ||
        status == 'failed') {
      icon = const Icon(
        Icons.check,
        color: Colors.redAccent,
      );
      color = Colors.redAccent;
    } else {
      icon = const Icon(
        Icons.check,
        color: Colors.redAccent,
      );
      color = Colors.redAccent;
    }

    return Row(
      children: [
        icon,
        Text("Order $status",
            style: TextStyle(
                fontSize: 15, color: color, fontWeight: FontWeight.bold))
      ],
    );
  }
}
