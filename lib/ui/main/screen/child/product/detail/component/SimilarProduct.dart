import 'package:chair/common/cons/ColorCons.dart';
import 'package:chair/ui/main/component/MyLabel.dart';
import 'package:flutter/cupertino.dart';

class SimiliarProduct extends StatefulWidget {
  const SimiliarProduct({Key? key}) : super(key: key);

  @override
  State<SimiliarProduct> createState() => _SimiliarProductState();
}

class _SimiliarProductState extends State<SimiliarProduct> {

  var products = <String>[
    "asset/img/thumbnail_chair_brown.png",
    "asset/img/thumbnail_chair_green.png",
    "asset/img/thumbnail_chair_grey.png",
    "asset/img/thumbnail_chair_orange.png",
    "asset/img/thumbnail_chair_silver.png",
    "asset/img/thumbnail_chair_yellow.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleDefault(strLabel: "Similiar Product", textColor: ColorCons.LABEL),
              SizedBox(height: 16),
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) =>
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: ColorCons.CONTAINER,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset(products[index], width: 50)),
                      )
                ),
              )
            ],
          ),
        ),
    );
  }
}
