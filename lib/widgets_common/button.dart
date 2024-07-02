// import 'package:ecommerce/consts/consts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// Widget Button({title, color, textColor, onPress}){
//   return ElevatedButton(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: color,
//       padding: EdgeInsets.all(12)
//     ),
//       onPressed: (){
//       onPress;
//       },
//       child: title.text.color(textColor).fontFamily(bold).make(),
//   );
// }

import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart'; // Import velocity_x if needed for the `.text` extension

Widget Button(
    {required String title,
    required Color color,
    required Color textColor,
    required VoidCallback onPress}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: title.text.color(textColor).fontFamily(bold).make(),
  );
}
