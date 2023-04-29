import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/base_page.dart';
import 'package:flutter_wc_admin/pages/ordres/widget_order_item.dart';
import 'package:flutter_wc_admin/provider/orders_provider.dart';
import 'package:provider/provider.dart';

class OrderList extends BasePage {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends BasePageState<OrderList> {
  @override
  void initState() {
    super.initState();
    pageTitle = 'Ordres';
    var orderProvider = Provider.of<OrderPrivider>(context, listen: false);
    orderProvider.fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return pageUI();
  }

  Widget pageUI() {
    return SingleChildScrollView(
      child: orderList(),
    );
  }

  Widget orderList() {
    return Consumer<OrderPrivider>(
      builder: (context, model, child) {
        // ignore: unnecessary_null_comparison
        if (model.ordersList != null) {
          return model.ordersList.isNotEmpty
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return WidgetOrderItem(orderModel: model.ordersList[index]);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: model.ordersList.length)
              : const Center(child: Text("No Order"));
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
