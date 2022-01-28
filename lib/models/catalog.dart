class Item {
  final String id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
    required this.image,
  });
}

final products = [
  Item(
    id: "001",
    name: "iPhone 12 Pro",
    description: "Apple iPhone 12 Pro generation",
    price: 999,
    color: "#33505a",
    image:
        "https://cdn.tmobile.com/content/dam/t-mobile/en-p/cell-phones/apple/Apple-iPhone-12-Pro/Silver/Apple-iPhone-12-Pro-Silver-frontimage.png",
  )
];
