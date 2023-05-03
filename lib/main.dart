import 'package:flutter/material.dart';
import 'package:flutter_wc_admin/pages/categories/categories_list.dart';
import 'package:flutter_wc_admin/pages/home_page.dart';
import 'package:flutter_wc_admin/pages/login_page.dart';
import 'package:flutter_wc_admin/provider/categories_provider.dart';
//import 'package:flutter_wc_admin/pages/ordres/ordres_list.dart';
import 'package:flutter_wc_admin/services/shared_services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

Widget _defaultHome = const LoginPage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isLogged = await SharedServices.isLoggedIn();
  if (isLogged) {
    _defaultHome = const HomePage();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
          child: const CategoriesList(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          primaryColor: Colors.orangeAccent,
        ),
        home: _defaultHome,
      ),
    );
  }
}
