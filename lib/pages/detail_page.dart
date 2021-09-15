import 'package:catalog_revision/models/catalog.dart';
import 'package:catalog_revision/widgets/theme.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)),
          ],
        )),
      ),
    );
  }
}
