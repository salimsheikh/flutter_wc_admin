import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/models/settigns_model.dart';
import 'package:flutter_wc_admin/provider/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class LoginPopupDialog {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  openDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: dialogContent(
            context,
            SettingModel(),
          ),
        );
      },
    );
  }

  Widget dialogContent(BuildContext context, SettingModel model) {
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 0),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 0,
                  offset: Offset.zero,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 24,
                ),
                Form(
                  key: globalKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FormHelper.inputFieldWidgetWithLabel(
                        context,
                        "username",
                        "Username",
                        "",
                        (onValidateValue) {
                          if (onValidateValue == "") {
                            return "Username cant be empty";
                          }
                          return null;
                        },
                        (onSaveValue) {
                          model.username = onSaveValue;
                        },
                        initialValue: model.username == null
                            ? ''
                            : model.username.toString(),
                        prefixIcon: const Icon(Icons.lock),
                        showPrefixIcon: true,
                      ),
                      FormHelper.inputFieldWidgetWithLabel(
                          context, "password", "Password", "",
                          (onValidateValue) {
                        if (onValidateValue == "") {
                          return "Password cant be empty";
                        }
                        return null;
                      }, (onSaveValue) {
                        model.password = onSaveValue;
                      },
                          initialValue: model.password == null
                              ? ''
                              : model.password.toString(),
                          prefixIcon: const Icon(Icons.lock),
                          showPrefixIcon: true,
                          obscureText:
                              Provider.of<LoginProvider>(context, listen: true)
                                  .hidePassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              Provider.of<LoginProvider>(context, listen: false)
                                  .onShowHidePassword();
                            },
                            icon: Icon(Provider.of<LoginProvider>(context,
                                        listen: true)
                                    .hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      FormHelper.submitButton("Login", () {}),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
