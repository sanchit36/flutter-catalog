import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/drawer.dart';
import 'package:myapp/widgets/item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => Catalog.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) => ItemWidget(
            item: dummyList[index],
          ),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
