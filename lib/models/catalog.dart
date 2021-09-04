import 'dart:convert';

class Item {
  int id;
  String name;
  String desc;
  int price;
  String color;
  String image;
  Item({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });
}
