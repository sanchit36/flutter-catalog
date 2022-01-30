import 'package:flutter/material.dart';
import 'package:myapp/models/catalog.dart';
import 'package:myapp/pages/home/widgets/add_to_cart.dart';
// import 'package:myapp/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(catalog.name),
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$ ${catalog.price}".text.bold.xl4.make(),
            AddToCart(catalog: catalog)
          ],
        ).p(40),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        catalog.name.text.xl4
                            .color(context.theme.colorScheme.secondary)
                            .bold
                            .make(),
                        catalog.desc.text.xl
                            .textStyle(context.captionStyle!)
                            .make(),
                        10.heightBox,
                        "Lorem dolores at erat rebum ipsum dolore et. Duo amet aliquyam voluptua kasd elitr sit duo kasd. Dolores no justo dolor takimata. Sed invidunt nonumy amet sanctus vero gubergren voluptua duo amet. Accusam elitr clita est diam sea dolor gubergren diam eirmod. Diam duo lorem accusam no ipsum diam dolor."
                            .text
                            .textStyle(context.captionStyle!)
                            .make()
                            .p16()
                      ],
                    ).py64(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
