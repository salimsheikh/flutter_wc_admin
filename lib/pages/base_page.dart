import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/setting_page.dart';
import 'package:flutter_wc_admin/provider/loader_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import '../services/shared_services.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => BasePageState();
}

class BasePageState<T extends BasePage> extends State<T> {
  String pageTitle = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<LoaderProvider>(builder: (context, loaderModel, child) {
      return Scaffold(
        appBar: buildAppBar(),
        body: ProgressHUD(
          key: UniqueKey(),
          inAsyncCall: loaderModel.isAPICallProcess,
          opacity: 0.3,
          child: pageUI(),
        ),
      );
    });
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
        title: Text(pageTitle),
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const SettingPage());
            },
            child: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ),
          IconButton(
              onPressed: () async {
                await SharedServices.logout();
              },
              icon: const Icon(Icons.logout, color: Colors.black)),
          const SizedBox(width: 10)
        ]);
  }

  Widget pageUI() {
    return const Text("BasePage");
  }

  @override
  void dispose() {
    super.dispose();
  }
}
