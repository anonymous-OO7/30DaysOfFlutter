import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "NEW - GADGETS".text.xl5.bold.color(Colors.blue).make(),
        "Trending Products".text.xl3.make(),
      ],
    );
  }
}