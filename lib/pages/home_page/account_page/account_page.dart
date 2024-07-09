import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/iconList.dart';
import 'package:ecommerce/pages/home_page/account_page/components/details_cards.dart';
import 'package:ecommerce/widgets_common/bg_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widgets_common/custom_textfield.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidgets(
        child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                  )).onTap(() {}),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(
                    imgProfile2,
                    width: 90,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      "  Dummy User"
                          .text
                          .fontFamily(semibold)
                          .white
                          .size(20)
                          .make(),
                      "   customer@example.com".text.size(12).white.make()
                    ],
                  )),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: whiteColor)),
                      onPressed: () {},
                      child: "Logout".text.make())
                ],
              ),
            ),
            // 10.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(
                  count: "00",title: "in your cart",width: context.screenWidth/3.5,
                ),
                detailsCard(
                  count: "32",title: "in your wishlist",width: context.screenWidth/3.5,
                ),
                detailsCard(
                  count: "675",title: "your orders",width: context.screenWidth/3.5,
                )
              ],
            ),
            // SizedBox(height: 10,),
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Divider(color: lightGrey,);
              },
              itemCount: profileButtonsList.length,
              itemBuilder: (BuildContext context,int index){
                return ListTile(
                  leading: Image.asset(profileButtonIcons[index],width: 22,),
                  title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                );
              },
            ).box.white.rounded.margin(EdgeInsets.all(12)).padding(EdgeInsets.symmetric(horizontal: 16)).shadowMax.make().box.color(redColor).make()
          ],
        ),
      ),
    ));
  }
}
