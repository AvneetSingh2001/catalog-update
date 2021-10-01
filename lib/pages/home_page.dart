import 'dart:convert';
import 'package:catalog_revision/core/my_store.dart';
import 'package:catalog_revision/models/cart.dart';
import 'package:catalog_revision/models/catalog.dart';
import 'package:catalog_revision/utils/routes.dart';
import 'package:catalog_revision/widgets/drawer.dart';
import 'package:catalog_revision/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_revision/widgets/home_widgets/catalog_list.dart';
import 'package:catalog_revision/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    await Future.delayed(Duration(seconds: 3));

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cartModel;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext context, store, VxStatus? status) =>
            FloatingActionButton(
          backgroundColor: Theme.of(context).buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pushNamed(context, Routes.CartPageRoute),
        ).badge(
                color: Colors.red,
                size: 20,
                count: _cart.items.length,
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
              Expanded(child: CatalogList())
            else
              Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ]),
        ),
      ),
    );
  }
}
