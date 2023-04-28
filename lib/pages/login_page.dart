import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_wc_admin/models/login_model.dart';
import 'package:flutter_wc_admin/pages/home_page.dart';
import 'package:flutter_wc_admin/services/api_services.dart';
import 'package:flutter_wc_admin/utils/form_helper.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  late LoginModel loginModel;

  @override
  void initState() {
    super.initState();
    loginModel = LoginModel(
        host: 'demos.infosofttech.com',
        key: 'ck_aec03edc720dd0f0b63aff85a96dc39dad09aeb5',
        secret: 'cs_0d405cd3ba14970660737aa4d9c234220d684622');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Form(
          key: globalFormKey,
          child: _loginUI(context),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor,
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/woocommerce-logo-e1429552613105-1024x260.png",
                    fit: BoxFit.contain,
                    width: 250,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20, top: 20),
              child: Text(
                "Admin Loing",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: TextFormField(
              decoration: fieldDecoration(
                context,
                "Enter Host Name",
                "",
                prefixIcon: const Icon(
                  Icons.web,
                  color: Colors.orangeAccent,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Host URL cant be empty";
                }
                return null;
              },
              onChanged: (value) => {},
              onSaved: (newValue) => {loginModel.host = newValue.toString()},
              initialValue: loginModel.host,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: TextFormField(
              decoration: fieldDecoration(
                context,
                "Enter Consumer key",
                "",
                prefixIcon: const Icon(
                  Icons.web,
                  color: Colors.orangeAccent,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Consumer key cant be empty";
                }
                return null;
              },
              onChanged: (value) => {},
              onSaved: (newValue) => {loginModel.key = newValue.toString()},
              initialValue: loginModel.key,
              // controller: TextEditingController(text: loginModel.key),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: TextFormField(
              decoration: fieldDecoration(
                context,
                "Enter Consumer secret",
                "",
                prefixIcon: const Icon(
                  Icons.web,
                  color: Colors.orangeAccent,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Consumer secret cant be empty";
                }
                return null;
              },
              onChanged: (value) => {},
              onSaved: (newValue) => {loginModel.secret = newValue.toString()},
              initialValue: loginModel.secret,
              // controller: TextEditingController(text: loginModel.secret),
            ),
          ),
          const Center(
            child: Text(
              "OR",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: GestureDetector(
              child: const Icon(
                Icons.qr_code,
                size: 100,
              ),
              onTap: () async {
                await scanQR();
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 50.0,
              width: 150.0,
              child: ElevatedButton(
                  onPressed: () {
                    if (isAPICallProcess == false) {
                      if (validateAndSave()) {
                        setState(() {
                          isAPICallProcess = true;
                        });

                        APIServices.checkLogin(loginModel).then(
                          (response) {
                            setState(() {
                              isAPICallProcess = false;
                            });

                            if (response) {
                              Get.offAll(() => const HomePage());
                            } else {
                              FormHelper.showMessage(
                                  context, "WooAdmin", "Login Failed", "OK",
                                  () {
                                setState(() {
                                  loginModel.key = "";
                                  loginModel.secret = "";
                                });
                                Navigator.of(context).pop();
                              });
                            }
                          },
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: (isAPICallProcess
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                              Text("Please wait - "),
                              SizedBox(width: 10),
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 1,
                                  color: Colors.white,
                                ),
                              )
                            ])
                      : const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ))),
            ),
          )
        ],
      ),
    );
  }

  Future<void> scanQR() async {
    String barcodeScanRes = "";

    loginModel.key = "1";

    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", false, ScanMode.QR);

      loginModel.key = "2";

      // print(barcodeScanRes);
    } on PlatformException {
      return;
    }

    if (!mounted) {
      return;
    }

    loginModel.key = "3";

    setState(() {
      loginModel.key = "4";

      loginModel.secret = barcodeScanRes;

      if (barcodeScanRes.isNotEmpty) {
        loginModel.key = barcodeScanRes.split("|")[0];
        loginModel.secret = barcodeScanRes.split("|")[1];
      }
    });
  }

  static InputDecoration fieldDecoration(
    BuildContext context,
    String hintText,
    String helperText, {
    prefixIcon,
    suffixIcon,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(6),
      hintText: hintText,
      helperText: helperText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;

    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
