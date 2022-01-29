import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/pages/home/widgets/catalog_list.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import 'package:myapp/pages/home/widgets/catalog_header.dart';
import 'package:myapp/widgets/themes.dart';
import 'package:myapp/models/catalog.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 3));
    final catalogJson = await rootBundle.loadString("assets/data/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    Catalog.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
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
