import 'package:catalog_revision/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  final List<int> _itemIds = [];

  void add(int id) {
    _itemIds.add(id);
  }

  void remove(int id) {
    _itemIds.remove(id);
  }

  List<Item> get items =>
      _itemIds.map((id) => _catalog.getItemById(id)).toList();

  int get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);
}
