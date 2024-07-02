import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget bgWidgets({Widget? child}){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(imgBackground),fit: BoxFit.fill),
    ),
      child: child
  );
}