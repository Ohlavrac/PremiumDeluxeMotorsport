import 'package:flutter/material.dart';
import 'package:premiun_deluxe_motorsport/modules/menu/main_menu.dart';
import 'package:premiun_deluxe_motorsport/modules/proof_purchase/proof_purchase_page.dart';
import 'package:premiun_deluxe_motorsport/modules/purchase_page/purchase_page.dart';
import 'package:premiun_deluxe_motorsport/modules/vehicles_list_page/vehicles_list_page.dart';
import 'package:premiun_deluxe_motorsport/shared/themes/app_colors.dart';

import 'modules/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Premiun Deluxe Motorsport",
      initialRoute: "/main_menu",
      routes: {
        "/splash": (context) => SplashPage(),
        "/main_menu": (context) => MainMenu(),
        "/purchase_page": (context) => PurchasePage(),
        "/vehicles_list": (context) => VehiclesListPage(),
      },
    );
  }
}