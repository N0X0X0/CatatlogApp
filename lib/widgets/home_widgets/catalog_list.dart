import 'package:flutter/material.dart';
import 'package:sample/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../../widgets/theme.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items!.length,
        itemBuilder: (context,index){
          final catalog= CatalogModel.items![index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context)=> HomeDetailPage(
                catalog: catalog,
                    ),
                  ),
              ),
              child: CatalogItem(catalog: catalog)
          );
        }
    );
  }
}
class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key ? key,required this.catalog})
      : assert(catalog!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [

            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image,
              ),
            ),

            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                catalog.name.text.lg.color(MyTheme.darkbluishColor).bold.make().px16(),
                catalog.desc.text.textStyle(context.captionStyle).make().px16(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mH8,
                  children: [
                    "\$${catalog.price}".text.bold.make().px8(),
                    ElevatedButton(onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            MyTheme.darkbluishColor,
                          ),
                          shape:MaterialStateProperty.all(
                            StadiumBorder(),
                          )
                      ),
                      child: "Buy".text.make(),
                    )
                  ],
                )
              ],
            ))
          ],
        )
    ).white.rounded.px8.square(140).make().py16();
  }
}