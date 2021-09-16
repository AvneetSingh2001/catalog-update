import 'package:catalog_revision/models/catalog.dart';
import 'package:catalog_revision/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "Buy".text.make())
                .wh(100, 50),
          ],
        ).p32(),
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Container(
            child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(
                catalog.image,
              ),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name.text.bold
                          .color(MyTheme.darkBluishColor)
                          .xl4
                          .make(),
                      catalog.desc.text.xl.caption(context).make(),
                      10.heightBox,
                      "Amet vero dolor sed elitr tempor clita et et, vero dolores est voluptua at. Elitr vero takimata gubergren dolores amet.Sadipscing lorem no elitr dolore kasd dolore elitr. Sit sanctus sit stet sit dolore lorem clita clita. Sadipscing sed sed no invidunt. Diam consetetur clita tempor kasd amet no voluptua sanctus. Sit rebum magna elitr vero sit lorem magna. Dolor voluptua elitr duo sanctus tempor elitr amet, diam diam consetetur."
                          .text
                          .caption(context)
                          .make()
                          .p16()
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
