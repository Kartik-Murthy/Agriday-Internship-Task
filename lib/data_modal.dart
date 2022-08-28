// ignore_for_file: public_member_api_docs, sort_constructors_first
class Item {
  String seller;
  String product;
  String variety;
  int price;
  int avgWeight;
  int perBox;
  int boxes;
  String delivery;

  Item({
    required this.seller,
    required this.product,
    required this.variety,
    required this.price,
    required this.avgWeight,
    required this.perBox,
    required this.boxes,
    required this.delivery,
  });

  static Item fromJson(json) => Item(
      seller: json['Seller'],
      product: json['Product'],
      variety: json['Variety'],
      price: json['Price'],
      avgWeight: json['AvgWeight'],
      perBox: json['PerBox'],
      boxes: json['Boxes'],
      delivery: json['Delivery']);
}
