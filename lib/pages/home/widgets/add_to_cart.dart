import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:myapp/models/catalog.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final _cart = Cart();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);

    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          final _catalog = Catalog();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);
          setState(() {
            isInCart = true;
          });
        }
      },
      child: isInCart
          ? const Icon(Icons.done)
          : const Icon(CupertinoIcons.cart_badge_plus),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor:
            MaterialStateProperty.all(context.theme.colorScheme.secondary),
        shape: MaterialStateProperty.all(const StadiumBorder()),
      ),
    );
  }
}
