import 'package:velocity_x/velocity_x.dart';

import 'package:myapp/models/cart.dart';
import 'package:myapp/models/catalog.dart';

class MyStore extends VxStore {
  Catalog catalog;
  Cart cart;

  MyStore(
    this.catalog,
    this.cart,
  ) {
    cart.catalog = catalog;
  }
}
