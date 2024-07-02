import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets_common/applogo_widgets.dart';
import '../login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      Get.to(() => LoginPage());
    });
  }


  @override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            SizedBox(height: 20), // Corrected spacing
            applogoWidgets(),
            SizedBox(height: 10),
            appname.text.fontFamily(bold).size(22).white.make(),
            SizedBox(height: 5),
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.make(),
            SizedBox(height: 15),

          ],
        ),
      ),
    );
  }
}
