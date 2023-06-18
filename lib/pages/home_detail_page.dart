import 'package:flutter/material.dart';
import 'package:sample/models/catalog.dart';
import 'package:sample/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) :  assert(catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,

      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mH8,
          children: [
            "\$${catalog.price}".text.xl4.red800.bold.make().px8(),
            ElevatedButton(onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkbluishColor,
                  ),
                  shape:MaterialStateProperty.all(
                    StadiumBorder(),
                  )
              ),
              child: "Buy".text.xl.make(),
            ).wh(100,45)
          ],
        ).p32(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
                child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.color(MyTheme.darkbluishColor).bold.make().px16(),
                        catalog.desc.text.textStyle(context.captionStyle).xl.make().px16(),
                        10.heightBox,
                        "Beyond adding 5G, Apple has equipped the iPhone 12 family with its powerful new A14 Bionic processor, a Super Retina XDR display, a more durable Ceramic Shield front cover, and a MagSafe feature for more reliable wireless charging, and support for attachable accessories."
                            .text.textStyle(context.captionStyle).make().p16()
                      ],
                    ).py64(),
                  ),
                ))
          ],

        )
      ),
    );
  }
}
