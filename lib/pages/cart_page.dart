import 'package:catalog_revision/core/my_store.dart';
import 'package:catalog_revision/models/cart.dart';
import 'package:catalog_revision/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Cart Page",
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
        ),
        body: Column(
          children: [
            Expanded(child: _cartList().p32()),
            Divider(
              color: Theme.of(context).accentColor,
            ).px8(),
            _cartTotal()
          ],
        ));
  }
}

class _cartTotal extends StatelessWidget {
  const _cartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cartModel;
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .bold
              .color(Theme.of(context).accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).buttonColor)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not supported yet".text.make()));
                  },
                  child: "Buy".text.make())
              .w32(context)
        ],
      ),
    );
  }
}

class _cartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cartModel;
    return _cart.items.isEmpty
        ? "Nothing to show".text.makeCentered()
        : ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                    onPressed: () {
                      _cart.remove(_cart.items[index]);
                    },
                    icon: Icon(Icons.remove_circle_outline)),
                title: _cart.items[index].name.text.make(),
              );
            },
            itemCount: _cart.items.length,
          );
  }
}
