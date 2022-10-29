
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/cons/ColorCons.dart';

class BottomHome extends StatefulWidget {
  BottomHome({required this.selectedIndex, required this.onTap});
  Function(int) onTap;
  int selectedIndex;
  @override
  State<BottomHome> createState() => _BottomHomeState();
}

class _BottomHomeState extends State<BottomHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/img/bg_bottom_bar.png"),
              fit: BoxFit.cover)
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
              icon: Image.asset("asset/img/ic_home.png"), label: "Home"),
          BottomNavigationBarItem(
              icon: Image.asset("asset/img/ic_product.png"),
              label: "Product"),
          BottomNavigationBarItem(
              icon: Image.asset("asset/img/ic_cart.png"),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Image.asset("asset/img/ic_user.png"),
              label: "User"),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: widget.selectedIndex,
        selectedItemColor: ColorCons.LABEL,
        onTap: widget.onTap,
      ),
    );
  }
}
