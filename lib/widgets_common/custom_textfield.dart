import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? title,String? hint,controller,bool? isPass}){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass!,
        controller: controller,
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: textfieldGrey,
          ),
          hintText: hint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: redColor,
            )
          )
        ),
      ),
      5.heightBox,
    ],
  );
}



// import 'package:ecommerce/consts/consts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// Widget customTextField({
//   required String title,
//   required String hint,
//   required TextEditingController controller,
//   required bool isPass,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       title!.text.color(redColor).fontFamily(semibold).size(16).make(),
//       5.heightBox,
//       TextFormField(
//         obscureText: isPass,
//         controller: controller,
//         decoration: InputDecoration(
//           hintStyle: TextStyle(
//             fontFamily: semibold,
//             color: textfieldGrey,
//           ),
//           hintText: hint,
//           isDense: true,
//           fillColor: lightGrey,
//           filled: true,
//           border: InputBorder.none,
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: redColor,
//             ),
//           ),
//         ),
//       ),
//       5.heightBox,
//     ],
//   );
// }





// import 'package:ecommerce/consts/consts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// Widget customTextField({
//   required String title,
//   required String hint,
//   required TextEditingController controller,
//   required bool isPass,
// }) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       title!.text.color(redColor).fontFamily(semibold).size(16).make(),
//       5.heightBox,
//       TextFormField(
//         obscureText: isPass,
//         controller: controller,
//         decoration: InputDecoration(
//           hintStyle: TextStyle(
//             fontFamily: semibold,
//             color: textfieldGrey,
//           ),
//           hintText: hint,
//           isDense: true,
//           fillColor: lightGrey,
//           filled: true,
//           border: InputBorder.none,
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(
//               color: redColor,
//             ),
//           ),
//         ),
//       ),
//       5.heightBox,
//     ],
//   );
// }
//
//
