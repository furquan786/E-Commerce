class CatalogModel {
  static List<Item> products = [];
}

class Item {
  final String name;
  final int id;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({
    required this.name,
    required this.id,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map["name"],
      id: map["id"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
