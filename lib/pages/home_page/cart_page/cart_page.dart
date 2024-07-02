import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white,
      child: "Cart is Empty".text.fontFamily(semibold).color(darkFontGrey).makeCentered(),
    );
  }
}
