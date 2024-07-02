import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/iconList.dart';
import 'package:ecommerce/pages/home_page/category_page/category_details.dart';
import 'package:ecommerce/widgets_common/bg_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidgets(
      child: Scaffold(
        appBar: AppBar(
          title: categories.text.fontFamily(bold).make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 200, crossAxisCount: 3),
              itemBuilder: (context,index){
            return Column(
              children: [
                Image.asset(categoryImages[index],height: 120,width: 200,fit: BoxFit.cover,),
                10.heightBox,
                categoryList[index].text.color(darkFontGrey).align(TextAlign.center).make()
              ],
            ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap((){
              Get.to(() => CategoryDetails(title: categoryList[index],));
            });
          }),
        ),
      )
    );
  }
}
