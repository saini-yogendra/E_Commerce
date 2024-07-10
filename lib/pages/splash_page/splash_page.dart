import 'package:ecommerce/consts/colors.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/pages/home_page/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    Future.delayed(const Duration(seconds: 3),(){
      // Get.to(() => LoginPage());
      auth.authStateChanges().listen((User? user){
        if(user == null && mounted) {
          Get.to(()=>const LoginPage());
        } else {
          Get.to(() => const Home());
        }
      });
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
            const SizedBox(height: 20), // Corrected spacing
            applogoWidgets(),
            const SizedBox(height: 10),
            appname.text.fontFamily(bold).size(22).white.make(),
            const SizedBox(height: 5),
            appversion.text.white.make(),
            const Spacer(),
            credits.text.white.make(),
            const SizedBox(height: 15),

          ],
        ),
      ),
    );
  }
}
