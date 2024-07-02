import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/home_controller.dart';
import 'package:ecommerce/pages/home_page/account_page/account_page.dart';
import 'package:ecommerce/pages/home_page/cart_page/cart_page.dart';
import 'package:ecommerce/pages/home_page/category_page/category_page.dart';
import 'package:ecommerce/pages/home_page/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller  = Get.put(HomeController());
    
    
    var navbarItem = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26,), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26,), label: categories),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26,), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26,), label: account),
    ];
    var navBody = [
      HomePage(),
      CategoryPage(),
      CartPage(),
      AccountPage(),
    ];
    
    return  Scaffold(
      body: Column(
        children: [
          Obx(()=>Expanded(child: navBody.elementAt(controller.currentNavIndex.value),),)
        ],
      ),
      bottomNavigationBar: Obx(() =>
        BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap:(value){
            controller.currentNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
