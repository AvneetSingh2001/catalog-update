import 'package:catalog_revision/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  late CatalogModel _catalog;

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  final List<int> _itemIds = [];

  void add(Item item) {
    _itemIds.add(item.id);
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
  }

  List<Item> get items =>
      _itemIds.map((id) => _catalog.getItemById(id)).toList();

  int get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);
}
