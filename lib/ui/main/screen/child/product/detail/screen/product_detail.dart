import 'package:chair/common/cons/ColorCons.dart';
import 'package:chair/ui/main/component/MyLabel.dart';
import 'package:chair/ui/main/screen/child/product/detail/component/SimilarProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../model/Product.dart';

class ProductDetail extends StatefulWidget {
  Product product;
  ProductDetail({required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {

  int _qty = 0;

  void addQty(){
    setState((){
      _qty += 1;
    });
  }

  void minQty(){
    setState((){
      if(_qty > 0) {
        _qty--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorCons.BACKGROUND_THUMBNAIL
              ),
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("asset/img/ic_back.png"),
                        titleTab("Detail", Colors.black),
                        Image.asset("asset/img/ic_love.png")
                      ],
                    ),
                  ),
                  Image.asset(widget.product.imgRes, width: 260, height: 260,)
                ],
              ),
            ),
            SizedBox(height: 16),
            infoProduct(widget.product),
            SizedBox(height: 8,),
            variantProduct(),
            SizedBox(height: 8,),
            productDescription(widget.product),
            SizedBox(height: 8,),
            SimiliarProduct()
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
                  child: textDesc(strLabel: product.desc))
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

  Widget variantProduct(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 8, 0, 0),
          child: titleDefault(strLabel: "Colour", textColor : ColorCons.LABEL),
        ),
        Row(
          children: [
            SizedBox(width: 4,),
            Expanded(child:
                Row(
                  children: [
                      productColor(ColorCons.YELLOW),
                      productColor(ColorCons.ORANGE),
                      productColor(ColorCons.PRIMARY_COLOR),
                  ],
                )
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: minQty,
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Image.asset("asset/img/ic_min.png", height: 24, width: 24,),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorCons.CONTAINER
                    ),
                  ),
                ),
                SizedBox(width: 8,),
                titleDefault(strLabel: "$_qty", textColor: ColorCons.LABEL),
                SizedBox(width: 8,),
                GestureDetector(
                  onTap: addQty,
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Image.asset("asset/img/ic_plus.png", height: 24, width: 24,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorCons.PRIMARY_COLOR
                    ),
                  ),
                ),
                SizedBox(width: 12,)
              ],
            )
          ],
        )
      ],
    );
  }

  Widget productColor(Color color){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 30,
        height: 21,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5)
        ),
      ),
    );
  }

  Widget productDescription(Product product){
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: titleDefault(strLabel: "Description", textColor : ColorCons.LABEL),
          ),
          SizedBox(height: 8,),
          textDesc(strLabel: product.desc),
        ],
      ),
    );
  }
}
