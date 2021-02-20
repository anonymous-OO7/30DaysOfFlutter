class CatalogModel{
 static final items = [
  Item(
    id: 1,
    name: "iphone 12 pro",
    desc: "apple i phone 12th generation",
    price: 999,
    color: "#33505a",
    image:
        "https://www.apple.com/newsroom/images/product/iphone/standard/Apple_announce-iphone12pro_10132020.jpg.og.jpg?202102050019",)
];


}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.desc, this.price, this.color, this.image});
}

