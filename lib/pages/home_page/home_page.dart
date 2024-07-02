// import 'package:ecommerce/consts/colors.dart';
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/consts/iconList.dart';
// import 'package:ecommerce/pages/home_page/components/feature_button.dart';
// import 'package:ecommerce/widgets_common/home_buttons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:velocity_x/velocity_x.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//
//     return Container(
//       padding: EdgeInsets.all(12),
//       color: lightGrey,
//       width: screenWidth,
//       height: screenHeight,
//       child: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 height: 60,
//                 color: lightGrey,
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     suffixIcon: Icon(Icons.search),
//                     filled: true,
//                     fillColor: whiteColor,
//                     hintText: searchAnyThing,
//                     hintStyle: TextStyle(
//                       color: textfieldGrey,
//                     ),
//                   ),
//                 ),
//               ),
//               VxSwiper.builder(
//                 aspectRatio: 16 / 9,
//                 autoPlay: true,
//                 height: 150,
//                 enlargeCenterPage: true,
//                 itemCount: sliderList.length,
//                 itemBuilder: (context, index) {
//                   return Image.asset(
//                     sliderList[index],
//                     fit: BoxFit.fitWidth,
//                   ).box.margin(EdgeInsets.symmetric(vertical: 5)).make();
//                 },
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(
//                   2,
//                   (index) => homeButtons(
//                     height: screenHeight * 0.15,
//                     width: screenWidth / 2.5,
//                     icon: index == 0 ? icTodaysDeal : icFlashDeal,
//                     title: index == 0 ? todayDeal : flashSale,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               VxSwiper.builder(
//                 aspectRatio: 16 / 9,
//                 autoPlay: true,
//                 height: 150,
//                 enlargeCenterPage: true,
//                 itemCount: secondSliderList.length,
//                 itemBuilder: (context, index) {
//                   return Image.asset(
//                     secondSliderList[index],
//                     fit: BoxFit.fitWidth,
//                   ).box.margin(EdgeInsets.symmetric(vertical: 5)).make();
//                 },
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: List.generate(
//                   3,
//                   (index) => homeButtons(
//                     height: screenHeight * 0.15,
//                     width: screenWidth / 3.5,
//                     icon: index == 0
//                         ? icTopCategories
//                         : index == 1
//                             ? icBrands
//                             : icTopSeller,
//                     title: index == 0
//                         ? topCategories
//                         : index == 1
//                             ? brand
//                             : topSeller,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: featuredCategories.text
//                     .color(darkFontGrey)
//                     .size(18)
//                     .fontFamily(semibold)
//                     .make(),
//               ),
//               20.heightBox,
//               SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: List.generate(
//                       3,
//                       (index) => Column(
//                             children: [
//                               featuredButton(
//                                   icon: featuredImages1[index],
//                                   title: featuredTitle1[index]),
//                               10.heightBox,
//                               featuredButton(
//                                   icon: featuredImages2[index],
//                                   title: featuredTitle2[index]),
//                             ],
//                           )).toList(),
//                 ),
//               ),
//               20.heightBox,
//               Container(
//                 padding: EdgeInsets.all(12),
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: redColor,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     featuredProduct.text.white.fontFamily(bold).make(),
//                     10.heightBox,
//                     SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: Row(
//                         children: List.generate(
//                             6,
//                             (index) => Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Image.asset(
//                                       imgP1,
//                                       width: 150,
//                                       fit: BoxFit.cover,
//                                     ),
//                                     10.heightBox,
//                                     "Laptop 4GB/64GB"
//                                         .text
//                                         .fontFamily(semibold)
//                                         .color(darkFontGrey)
//                                         .make(),
//                                     10.heightBox,
//                                     "\$600"
//                                         .text
//                                         .color(redColor)
//                                         .fontFamily(semibold)
//                                         .size(16)
//                                         .make()
//                                   ],
//                                 )
//                                     .box
//                                     .white
//                                     .margin(EdgeInsets.symmetric(horizontal: 4))
//                                     .roundedSM
//                                     .padding(EdgeInsets.all(8))
//                                     .make()),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               20.heightBox,
//               VxSwiper.builder(
//                 aspectRatio: 16 / 9,
//                 autoPlay: true,
//                 height: 150,
//                 enlargeCenterPage: true,
//                 itemCount: secondSliderList.length,
//                 itemBuilder: (context, index) {
//                   return Image.asset(
//                     secondSliderList[index],
//                     fit: BoxFit.fitWidth,
//                   ).box.margin(EdgeInsets.symmetric(vertical: 5)).make();
//                 },
//               ),
//               20.heightBox,
//               GridView.builder(
//                 shrinkWrap: true,
//                   itemCount: 6,
//
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount,
//                   itemBuilder: (context, index) {
//                     return Container();
//                   })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/iconList.dart';
import 'package:ecommerce/pages/home_page/components/feature_button.dart';
import 'package:ecommerce/widgets_common/home_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(12),
      color: lightGrey,
      width: screenWidth,
      height: screenHeight,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Search Bar
              Container(
                alignment: Alignment.center,
                height: 60,
                color: lightGrey,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor: whiteColor,
                    hintText: searchAnyThing,
                    hintStyle: TextStyle(
                      color: textfieldGrey,
                    ),
                  ),
                ),
              ),
              // First Swiper
              VxSwiper.builder(
                aspectRatio: 16 / 9,
                autoPlay: true,
                height: 150,
                enlargeCenterPage: true,
                itemCount: sliderList.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    sliderList[index],
                    fit: BoxFit.fitWidth,
                  ).box.margin(EdgeInsets.symmetric(vertical: 5)).make();
                },
              ),
              SizedBox(height: 10),
              // Home Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  2,
                      (index) => homeButtons(
                    height: screenHeight * 0.15,
                    width: screenWidth / 2.5,
                    icon: index == 0 ? icTodaysDeal : icFlashDeal,
                    title: index == 0 ? todayDeal : flashSale,
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Second Swiper
              VxSwiper.builder(
                aspectRatio: 16 / 9,
                autoPlay: true,
                height: 150,
                enlargeCenterPage: true,
                itemCount: secondSliderList.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    secondSliderList[index],
                    fit: BoxFit.fitWidth,
                  ).box.margin(EdgeInsets.symmetric(vertical: 5)).make();
                },
              ),
              SizedBox(height: 10),
              // Home Buttons - Second Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                      (index) => homeButtons(
                    height: screenHeight * 0.15,
                    width: screenWidth / 3.5,
                    icon: index == 0
                        ? icTopCategories
                        : index == 1
                        ? icBrands
                        : icTopSeller,
                    title: index == 0
                        ? topCategories
                        : index == 1
                        ? brand
                        : topSeller,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Featured Categories Title
              Align(
                alignment: Alignment.centerLeft,
                child: featuredCategories.text
                    .color(darkFontGrey)
                    .size(18)
                    .fontFamily(semibold)
                    .make(),
              ),
              SizedBox(height: 20),
              // Featured Buttons
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    3,
                        (index) => Column(
                      children: [
                        featuredButton(
                            icon: featuredImages1[index],
                            title: featuredTitle1[index]),
                        SizedBox(height: 10),
                        featuredButton(
                            icon: featuredImages2[index],
                            title: featuredTitle2[index]),
                      ],
                    ),
                  ).toList(),
                ),
              ),
              SizedBox(height: 20),
              // Featured Products
              Container(
                padding: EdgeInsets.all(12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: redColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    featuredProduct.text.white.fontFamily(bold).make(),
                    SizedBox(height: 10),
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
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Third Swiper
              VxSwiper.builder(
                aspectRatio: 16 / 9,
                autoPlay: true,
                height: 150,
                enlargeCenterPage: true,
                itemCount: secondSliderList.length,
                itemBuilder: (context, index) {
                  return Image.asset(
                    secondSliderList[index],
                    fit: BoxFit.fitWidth,
                  ).box.margin(EdgeInsets.symmetric(vertical: 5)).make();
                },
              ),
              SizedBox(height: 20),
              // GridView
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 250,// Number of items in a row
                  crossAxisSpacing: 10.0, // Horizontal spacing between items
                  mainAxisSpacing: 10.0, // Vertical spacing between items
                  childAspectRatio: 1.0, // Aspect ratio of the items
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        imgP5,
                        height: 150,
                        width: 200,
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
                      .make();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
