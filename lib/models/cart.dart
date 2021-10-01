import 'package:catalog_revision/core/my_store.dart';
import 'package:catalog_revision/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  late CatalogModel _catalog;

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  final List<int> _itemIds = [];

  void remove(Item item) {
    _itemIds.remove(item.id);
  }

  List<Item> get items =>
      _itemIds.map((id) => _catalog.getItemById(id)).toList();

  int get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cartModel._itemIds.add(item.id);
  }
}
