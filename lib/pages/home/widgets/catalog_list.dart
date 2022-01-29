import 'package:flutter/material.dart';
import 'package:myapp/pages/home/home_detail_page.dart';
import 'package:myapp/pages/home/widgets/catalog_image.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:myapp/models/catalog.dart';
import 'package:myapp/widgets/themes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Catalog.items.length,
      itemBuilder: (context, index) {
        final catalog = Catalog.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                catalog: catalog,
              ),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(context.theme.colorScheme.secondary)
                    .bold
                    .make(),
                catalog.desc.text.textStyle(context.captionStyle!).make(),
                10.heightBox,
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$ ${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      onPressed: () {},
                      child: "Add to cart".text.white.make(),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.colorScheme.secondary),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                    )
                  ],
                ).pOnly(right: 8)
              ],
            ),
          )
        ],
      ),
    ).color(context.theme.cardColor).rounded.square(150).make().py16();
  }
}
