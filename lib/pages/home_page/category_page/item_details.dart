// import 'package:ecommerce/consts/colors.dart';
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/widgets_common/button.dart';
// import 'package:flutter/material.dart';
//
// class ItemDetails extends StatelessWidget {
//   final String? title;
//   const ItemDetails({Key? key, required this.title}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: lightGrey,
//       appBar: AppBar(
//         title: title!.text.color(darkFontGrey).fontFamily(bold).make(),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.share,
//               color: darkFontGrey,
//             ),
//           ),
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.favorite_border_outlined,
//                 color: darkFontGrey,
//               )),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: Container(
//             color: Colors.red,
//           )),
//           SizedBox(
//             width: double.infinity,
//             child: Button(
//                 title: "Add to cart",
//                 color: redColor,
//                 textColor: whiteColor,
//                 onPress: () {}).box.height(55).make(),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/iconList.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: Text(
          title ?? '',
          style: TextStyle(
            color: darkFontGrey,
            fontFamily: bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: darkFontGrey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_outlined,
              color: darkFontGrey,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      autoPlay: true,
                      height: 350,
                      itemCount: 3,
                      aspectRatio: 16 / 9,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imgFc5,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      }),
                  10.heightBox,
                  title!.text
                      .size(16)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  10.heightBox,
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  10.heightBox,
                  "\$30,000"
                      .text
                      .color(redColor)
                      .fontFamily(bold)
                      .size(18)
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brands"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      ),
                    ],
                  )
                      .box
                      .height(60)
                      .padding(EdgeInsets.symmetric(horizontal: 16))
                      .color(textfieldGrey)
                      .make(),
20.heightBox,
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: "Color ".text.color(textfieldGrey).make()
                          ),
                          Row(
                            children: List.generate(3, (index) => VxBox().size(40, 40).roundedFull.color(Vx.randomPrimaryColor).margin(EdgeInsets.symmetric(horizontal: 6)).make())
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: "Quantity ".text.color(textfieldGrey).make()
                          ),
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                              "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                              10.heightBox,
                              "(0 available)".text.color(textfieldGrey).make()
                            ],
                          )
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),
                      Row(
                        children: [
                          SizedBox(
                              width: 100,
                              child: "Total ".text.color(textfieldGrey).make()
                          ),
                          "\$0.00".text.color(redColor).size(16).fontFamily(bold).make()
                        ],
                      ).box.padding(EdgeInsets.all(8)).make(),

                    ],
                  ).box.shadowMd.white.make(),

                  10.heightBox,
                  "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                  10.heightBox,
                  "This is a Dummy item and Dummy description here.....".text.color(darkFontGrey).make(),
                  10.heightBox,

                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: List.generate(
                        itemDetailButtonsList.length,
                            (index) => ListTile(
                      title: itemDetailButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                      trailing: Icon(Icons.arrow_forward),
                    )),
                  ),
                  20.heightBox,
                  
                  productsyoumaylike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
                  10.heightBox,

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        6,
                            (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP1,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 10),
                            "Laptop 4GB/64GB"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            SizedBox(height: 10),
                            "\$600"
                                .text
                                .color(redColor)
                                .fontFamily(semibold)
                                .size(16)
                                .make()
                          ],
                        )
                            .box
                            .white
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .roundedSM
                            .padding(EdgeInsets.all(8))
                            .make(),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(redColor),
                foregroundColor: WidgetStateProperty.all(whiteColor),
                shape: WidgetStateProperty.all(const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                )),
                minimumSize: WidgetStateProperty.all(Size.fromHeight(55)),
              ),
              child: const Text("Add to cart"),
            ),
          ),
        ],
      ),
    );
  }
}
