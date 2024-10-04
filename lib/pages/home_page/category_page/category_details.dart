 import 'package:ecommerce/controller/product_controller.dart';
import 'package:ecommerce/pages/home_page/category_page/item_details.dart';
import 'package:ecommerce/widgets_common/bg_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidgets(

        child: Scaffold(
      appBar: AppBar(title: title!.text.fontFamily(bold).make()),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    controller.subcat.length,
                    (index) => "${controller.subcat[index]}"
                        .text
                        .size(12)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .roundedSM
                        .size(120, 60)
                        .margin(EdgeInsets.symmetric(horizontal: 4))
                        .make()),
              ),
            ),
            20.heightBox,
            Expanded(
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 6,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 250,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8),
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
                          .outerShadowMd
                          .padding(EdgeInsets.all(8))
                          .make()
                          .onTap(() {
                        Get.to(() => ItemDetails(
                              title: "Dummy item",
                            ));
                      });
                    }))
          ],
        ),
      ),
    ));
  }
}
