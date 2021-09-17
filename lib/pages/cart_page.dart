import 'package:catalog_revision/widgets/theme.dart';
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
            Expanded(child: Placeholder().p32()),
            Divider(
              color: Colors.black,
            ),
            Placeholder().h10(context).p16(),
          ],
        ));
  }
}
