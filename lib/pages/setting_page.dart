import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/base_page.dart';
import 'package:flutter_wc_admin/pages/utils/login_popup.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class SettingPage extends BasePage {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends BasePageState<SettingPage> {
  @override
  void initState() {
    super.initState();
    pageTitle = "Setting Page";
  }

  @override
  Widget pageUI() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: FormHelper.inputFieldWidgetWithLabel(
                context,
                'token',
                "JWT Token",
                "",
                () {},
                () {},
                prefixIcon: const Icon(Icons.lock),
                showPrefixIcon: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    LoginPopupDialog().openDialog(context);
                  },
                  icon: const Icon(Icons.refresh),
                ),
                paddingLeft: 0,
                paddingRight: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
