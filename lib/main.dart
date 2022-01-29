import 'package:flutter/material.dart';
import 'package:myapp/pages/cart_page.dart';

import 'package:myapp/pages/home/home_page.dart';
import 'package:myapp/pages/login_page.dart';
import 'package:myapp/utils/routes.dart';
import 'package:myapp/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoute.loginRoute,
      routes: {
        '/': (context) => LoginPage(),
        MyRoute.homeRoute: (context) => HomePage(),
        MyRoute.loginRoute: (context) => LoginPage(),
        MyRoute.cartRoute: (context) => CartPage(),
      },
    );
  }
}
