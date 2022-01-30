import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/pages/home/widgets/catalog_list.dart';
import 'package:myapp/utils/routes.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';
// import 'package:http/http.dart' as http;

import 'package:myapp/pages/home/widgets/catalog_header.dart';
import 'package:myapp/models/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    final catalogJson = await rootBundle.loadString("assets/data/catalog.json");
    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    Catalog.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (ctx, _, _s) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoute.cartRoute),
          backgroundColor: context.theme.colorScheme.secondary,
          child: const Icon(CupertinoIcons.cart, color: Colors.white),
        ).badge(
            color: Vx.red500,
            size: 22,
            count: _cart.items.length,
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatlogHeader(),
              16.heightBox,
              if (Catalog.items.isNotEmpty)
                const CatalogList().expand()
              else
                const CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}
