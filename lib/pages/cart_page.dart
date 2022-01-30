import 'package:flutter/material.dart';
import 'package:myapp/core/store.dart';
import 'package:myapp/models/cart.dart';

import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final Cart _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            builder: (context, _, _status) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.theme.colorScheme.secondary)
                  .make();
            },
            mutations: const {RemoveMutation},
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  content: "Buying not supported yet.".text.make(),
                ),
              );
            },
            child: "Buy".text.white.make(),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  context.theme.colorScheme.secondary),
            ),
          ).w32(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final Cart _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Noting to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              trailing: IconButton(
                onPressed: () => RemoveMutation(_cart.items[index]),
                icon: const Icon(Icons.remove_circle_outline),
              ),
              title: _cart.items[index].name.text.make(),
              subtitle: "\$${_cart.items[index].price}".text.make(),
            ),
          );
  }
}
