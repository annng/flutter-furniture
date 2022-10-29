import 'package:chair/common/cons/ColorCons.dart';
import 'package:chair/model/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../component/MyLabel.dart';
import '../../product/detail/screen/product_detail.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  List<Product> _items = [
    Product(30, "asset/img/img_chair_blue.png", "Overstuffed Chair",
        "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.", 3000, 3.5),
    Product(0, "asset/img/img_chair_green.png", "Windsor Chair",
        "Amet minim mollit non", 5000, 2.5),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 366,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductDetail(product: _items[index])),
                );
              },
              child: itemProduct(_items[index]))),
    );
  }

  Widget itemProduct(Product product) {
    return SizedBox(
      width: 250,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            thumbnailProduct(product),
            infoProduct(product),
            priceProduct(product)
          ],
        ),
      ),
    );
  }

  Widget thumbnailProduct(Product product) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 238,
        height: 238,
        decoration: BoxDecoration(
            color: ColorCons.BG_IMAGE, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                product.imgRes,
                fit: BoxFit.contain,
              ),
            ),
            Visibility(
              visible: product.discount > 0,
              child: Positioned(
                right: 8.0,
                top: 8,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: textDiscount(strLabel: "30% Off"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget infoProduct(Product product) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(width: 12.0),
        Expanded(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: titleTab(product.title, Colors.black)),
              SizedBox(
                height: 4.0,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: textDescEllipsize(strLabel: product.desc))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
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
    );
  }

  Widget priceProduct(Product product) {
    return Row(
      children: [
        SizedBox(
          width: 12.0,
        ),
        Expanded(child: titleTab("Rp ${product.price}", Colors.black)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorCons.PRIMARY_COLOR),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
