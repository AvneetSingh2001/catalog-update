import 'package:catalog_revision/models/cart.dart';
import 'package:catalog_revision/models/catalog.dart';
import 'package:catalog_revision/pages/detail_page.dart';
import 'package:catalog_revision/pages/home_page.dart';
import 'package:catalog_revision/widgets/home_widgets/catalog_image.dart';
import 'package:catalog_revision/widgets/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../add_to_cart.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                          catalog: catalog,
                        ))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              catalog.name.text
                  .color(Theme.of(context).accentColor)
                  .bold
                  .lg
                  .make(),
              catalog.desc.text
                  .color(Theme.of(context).accentColor)
                  .caption(context)
                  .make(),
              10.heightBox,
              ButtonBar(
                buttonPadding: EdgeInsets.all(0),
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${catalog.price}"
                      .text
                      .bold
                      .lg
                      .color(Theme.of(context).buttonColor)
                      .make(),
                  AddToCart(
                    catalog: catalog,
                  )
                ],
              ).pOnly(right: 8.0)
            ],
          ),
        )
      ],
    )).color(Theme.of(context).cardColor).rounded.p3.square(150).make().py8();
  }
}
