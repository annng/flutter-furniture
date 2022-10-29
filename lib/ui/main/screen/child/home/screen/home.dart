import 'package:chair/common/cons/ColorCons.dart';
import 'package:chair/ui/main/component/MyLabel.dart';
import 'package:chair/ui/main/screen/child/home/component/ListCategory.dart';
import 'package:chair/ui/main/screen/child/home/component/ListProduct.dart';
import 'package:chair/ui/main/screen/child/home/component/ListRecentProduct.dart';
import 'package:chair/ui/main/screen/child/product/detail/component/SimilarProduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: titleHome("Choose Your Best\nFurniture")),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorCons.CONTAINER),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Image.asset("asset/img/ic_search.png"),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search a Furniture",
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: ColorCons.PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset("asset/img/ic_filter.png"),
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            ListCategory(),
            ListProduct(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: titleTab("Recent View", ColorCons.LABEL)),
                  GestureDetector(onTap: () {
                    //Todo see all
                  }, child: titleSmall(strLabel: "See All"))
                ],
              ),
            ),
            ListRecentProduct()
          ],
        ),
      ),
    );
  }
}
