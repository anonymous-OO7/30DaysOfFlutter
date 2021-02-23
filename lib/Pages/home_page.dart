import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:helloflutter/models/catalog.dart';
import 'package:helloflutter/widgets/drawer.dart';
import 'package:helloflutter/widgets/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Gaurav";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 4));
    final catalogJson =
        await rootBundle.loadString("lib/assets/files/catalog.json");
    //print(catalogJson);
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: Vx.m32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CatalogHeader(),
                    if (CatalogModel.items != null &&
                        CatalogModel.items.isNotEmpty)
                      CatalogList().expand()
                    else
                      Center(
                        child: CircularProgressIndicator(),
                      )
                  ],
                ))),
              //  drawer: MyDrawer(),
                );
  }
}

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Colors.blue).make(),
        "Trending Products".text.xl3.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(Colors.brown).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mH8,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed: (){},
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.greenAccent)
                  ),

                  //shape:MaterialStateProperty.all(StadiumBorder()),
                   child: "BUY".text.make(),)
                ],
              )
            ],
          ),
        )
      ],
    )).blue100.roundedLg.square(130).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(Colors.amberAccent)
        .make()
        .p16()
        .w40(context);
  }
}
