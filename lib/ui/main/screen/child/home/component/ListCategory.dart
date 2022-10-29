import 'dart:ffi';

import 'package:chair/common/cons/ColorCons.dart';
import 'package:chair/ui/main/component/MyLabel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCategory extends StatefulWidget {
  const ListCategory({Key? key}) : super(key: key);

  @override
  State<ListCategory> createState() => _ListCategoryState();
}

class _ListCategoryState extends State<ListCategory> {
  var _selectedIndex = 0;

  List<String> items = [
    "Chair",
    "Bed",
    "Table",
    "Lamp",
    "Lamp",
  ];

  void itemClick(int selected) {
    setState(() {
      _selectedIndex = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index) => GestureDetector(
              onTap: () {
                itemClick(index);
              },
              child: itemCategory(items[index], index == _selectedIndex))),
    );
  }

  Widget itemCategory(String title, bool selected) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: selected ? ColorCons.PRIMARY_COLOR : Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8.0, 16, 8),
          child: titleTab(
              title, selected ? Colors.white : ColorCons.UNSELECTED_TITLE),
        ),
      ),
    );
  }
}
