import 'package:myapp/models/catalog.dart';

class Cart {
  Catalog _catalog = Catalog();

  final List<int> _itemsIds = [];

  Catalog get catalog => _catalog;

  set catalog(Catalog newCatalog) {
    _catalog = newCatalog;
  }

  // Grt items in cart
  List<Item> get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  // Add Item
  void add(Item item) {
    _itemsIds.add(item.id);
  }

  // Remove Item
  void remove(Item item) {
    _itemsIds.remove(item.id);
  }
}
