import 'package:chair/common/cons/ColorCons.dart';
import 'package:flutter/material.dart';

Widget titleHome(String strLabel) {
  return Text(
    strLabel,
    style: const TextStyle(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
  );
}

Widget titleTab(String strLabel, Color textColor) {
  return Text(
    strLabel,
    style: TextStyle(
        color: textColor, fontSize: 18, fontWeight: FontWeight.w600),
  );
}

Widget textDiscount({required String strLabel, Color textColor = Colors.black}) {
  return Text(
    strLabel,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    softWrap: true,
    style: TextStyle(
        color: textColor, fontSize: 10, fontWeight: FontWeight.w600),
  );
}

Widget textDesc({required String strLabel, Color textColor = ColorCons.UNSELECTED_TITLE}) {
  return Text(
    strLabel,
    style: TextStyle(
        color: textColor, fontSize: 12, fontWeight: FontWeight.w400),
  );
}

Widget textDescEllipsize({required String strLabel, Color textColor = ColorCons.UNSELECTED_TITLE, int maxLine = 1}) {
  return Text(
    strLabel,
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
    style: TextStyle(
        color: textColor, fontSize: 12, fontWeight: FontWeight.w400),
  );
}

Widget titleSmall({required String strLabel, Color textColor = ColorCons.PRIMARY_COLOR}) {
  return Text(
    strLabel,
    style: TextStyle(
        color: textColor, fontSize: 14, fontWeight: FontWeight.w600),
  );
}


Widget titleDefault({required String strLabel, Color textColor = ColorCons.PRIMARY_COLOR}) {
  return Text(
    strLabel,
    style: TextStyle(
        color: textColor, fontSize: 16, fontWeight: FontWeight.w600),
  );
}
