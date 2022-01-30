import 'package:flutter/material.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/catalog.dart';

import 'package:velocity_x/velocity_x.dart';

import 'package:myapp/core/store.dart';
import 'package:myapp/pages/cart_page.dart';
import 'package:myapp/pages/home/home_page.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/themes.dart';

void main() {
  runApp(VxState(
    store: MyStore(Catalog(), Cart()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoute.homeRoute,
      routes: {
        '/': (context) => LoginPage(),
        MyRoute.homeRoute: (context) => HomePage(),
        MyRoute.loginRoute: (context) => LoginPage(),
        MyRoute.cartRoute: (context) => CartPage(),
      },
    );
  }
}
