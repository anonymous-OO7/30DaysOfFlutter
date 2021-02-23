import 'package:flutter/material.dart';
import 'package:helloflutter/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key,@required this.catalog}) :assert(catalog != null) ,super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blueAccent,
      bottomNavigationBar: Container(
        color: Colors.amberAccent,
      
            child:ButtonBar(
        
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mH8,
                children: [
                  "\$${catalog.price}".text.bold.xl5.red800.make(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.greenAccent)),

                    //shape:MaterialStateProperty.all(StadiumBorder()),
                    child: "BUY".text.make(),
                  ).w24(context)
                ],


      ).wh(150, 70),

    ),
      
      body:SafeArea(
        bottom: false,
       child:Column(children: [
         Hero(
           tag: Key(catalog.id.toString()),
        child: Image.network(catalog.image)
       ).p16(),

       Expanded(child: VxArc(
         height: 30,
         arcType: VxArcType.CONVEY,
         edge: VxEdge.TOP,
         child:  Container(
         color: Colors.green,
         width: context.screenWidth,
         child: Column(children: [ catalog.name.text.xl4.color(Colors.brown).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).xl2.make(),
              10.heightBox,],).py64(),

       ),
       )
       
       
       )


      ],),
    ),
    );
  }
}
