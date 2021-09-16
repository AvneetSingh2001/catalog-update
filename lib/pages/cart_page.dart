import 'package:catalog_revision/widgets/theme.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart Page"),
      ),
      body: Center(
        child: Text("Cart Page"),
      ),
    );
  }
}
