class Item {
  String imageUrl, itemName, likes, description, price, category;
  bool instock;

  Item.fromMap(Map<String, dynamic> data) {
    imageUrl = data['imageUrl'];
    itemName = data['itemName'];
    likes = data['likes'];
    description = data['description'];
    price = data['price'];
    category = data['category'];
    instock = data['instock'];
  }
}
