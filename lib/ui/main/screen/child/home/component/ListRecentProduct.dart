import 'package:chair/ui/main/screen/child/product/detail/screen/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../common/cons/ColorCons.dart';
import '../../../../../../model/Product.dart';
import '../../../../component/MyLabel.dart';

class ListRecentProduct extends StatefulWidget {
  const ListRecentProduct({Key? key}) : super(key: key);

  @override
  State<ListRecentProduct> createState() => _ListRecentProductState();
}

class _ListRecentProductState extends State<ListRecentProduct> {

  List<Product> _items = [
    Product(30, "asset/img/thumbnail_chair_green.png", "Nixon Armchair",
        "Amet minim mollit non descriptoin of product", 2799, 4.5),
    Product(0, "asset/img/thumbnail_chair_grey.png", "Sabra Chair",
        "Amet minim mollit non", 599, 2.5),
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 103,
      child: ListView.builder(
          itemCount: _items.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) =>
        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetail(product: _items[index])),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                thumbnailProduct(_items[index]),
                infoProduct(_items[index]),
            ],
          ),
          ),
        )
      ),
    );
  }

  Widget thumbnailProduct(Product product){
    return Container(
      width: 75,
      height: 96,
      decoration: BoxDecoration(
          color: ColorCons.BG_IMAGE,
          borderRadius: BorderRadius.circular(10)),
      child: Image.asset(product.imgRes, fit: BoxFit.contain),
    );
  }

  Widget infoProduct(Product product){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment : Alignment.topLeft,
              child: textDesc(strLabel: product.title, textColor: Colors.black)),
          SizedBox(height: 8,),
          Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 120,
                  child: textDiscount(strLabel: product.desc, textColor: ColorCons.UNSELECTED_TITLE))),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                titleSmall(strLabel: "Rp ${product.price}", textColor: ColorCons.LABEL),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,12,0),
                  child: Row(
                    children: [
                      Image.asset(
                        "asset/img/ic_star.png",
                        height: 24,
                        width: 24,
                      ),
                      textDesc(strLabel: "${product.rating}")
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
