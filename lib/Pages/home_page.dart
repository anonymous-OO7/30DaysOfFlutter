import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helloflutter/Pages/home_widgets/catalog_header.dart';
import 'package:helloflutter/Pages/home_widgets/catalog_list.dart';
import 'dart:convert';
import 'package:helloflutter/models/catalog.dart';
import 'package:helloflutter/widgets/drawer.dart';
//import 'package:helloflutter/widgets/item_widget.dart';
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
    await Future.delayed(Duration(seconds: 6));
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
           child:Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    CatalogList().py16().expand()
                  else
                    Center(
                      child: CircularProgressIndicator().centered().expand(),
                    )
                ],
              ))),
       drawer: MyDrawer(),
    );
  }
}




