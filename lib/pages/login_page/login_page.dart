//
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/consts/iconList.dart';
// import 'package:ecommerce/controller/auth_controller.dart';
// import 'package:ecommerce/pages/home_page/home/home.dart';
// import 'package:ecommerce/widgets_common/applogo_widgets.dart';
// import 'package:ecommerce/widgets_common/bg_widgets.dart';
// import 'package:ecommerce/widgets_common/button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/widgets_common/custom_textfield.dart' as custom;
//
// import '../signup_page/signup_page.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(AuthController());
//
//     return bgWidgets(
//         child: Scaffold(
//           resizeToAvoidBottomInset: true, // Set this to true or false
//           body: Center(
//             child: SingleChildScrollView( // Add this
//               child: Column(
//                   children: [
//                   (context.screenHeight * 0.06).heightBox,
//               applogoWidgets(),
//               10.heightBox,
//               "Log in to $appname".text.fontFamily(bold).size(18).white.make(),
//               15.heightBox,
//               Obx(
//                     ()=> Column(
//                   children: [
//                     custom.customTextField(title: email, hint: emailHint,isPass: false,controller: controller.emailController),
//                     20.heightBox,
//                     custom.customTextField(title: password, hint: passwordHint,isPass: true,controller: controller.passwordController),
//                     Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                             onPressed: () {}, child: forgetPassword.text.make())),
//                     5.heightBox,
//                     // Button().box.width(context.screenWidth -50).make(),
//                     controller.isLoading.value ? const CircularProgressIndicator(
//                       valueColor: AlwaysStoppedAnimation(redColor),
//                     ) :
//                     Button(
//                         color: redColor,
//                         title: login,
//                         textColor: whiteColor,
//                         onPress: () async {
//                           controller.isLoading(true);
//                           await controller.loginMethod(context: context).then((value){
//                             if(value != null) {
//                               VxToast.show(context, msg: loggedin);
//                               Get.offAll(() => Home());
//                             }else{
//                               controller.isLoading(false);
//                             }
//                           });
//                         })
//                         .box
//                         .width(context.screenWidth)
//                         .make(),
//                     15.heightBox,
//                     createNewAccount.text.color(fontGrey).make(),
//                     15.heightBox,
//                     // Button().box.width(context.screenWidth -50).make(),
//                     Button(
//                         color: lightGolden,
//                         title: signup,
//                         textColor: redColor,
//                         onPress: () {
//                           Get.to(()=> const SignupPage());
//                         })
//                         .box
//                         .width(context.screenWidth)
//                         .make(),
//
//                     // Button(color: redColor, title: login, textcolor: whiteColor, onPress: (){}).box.make(),
//                     20.heightBox,
//                     loginWith.text.color(fontGrey).make(),
//                     15.heightBox,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(
//                           3,
//                               (index) => Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CircleAvatar(
//                               radius: 25,
//                               backgroundColor: lightGrey,
//                               child: Image.asset(
//                                 socialIconList[index],
//                                 width: 30,
//                               ),
//                             ),
//                           )),
//                     )
//                   ],
//                 )
//                     .box
//                     .white
//                     .rounded
//                     .padding(const EdgeInsets.all(16))
//                     .width(context.screenWidth - 70)
//                     .shadowMax
//                     .make(),
//
//               ),
//
//               ],
//               ),
//             ),
//           ),
//         ));
//   }
// }







//
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/consts/iconList.dart';
// import 'package:ecommerce/controller/auth_controller.dart';
// import 'package:ecommerce/pages/home_page/home/home.dart';
// import 'package:ecommerce/widgets_common/applogo_widgets.dart';
// import 'package:ecommerce/widgets_common/bg_widgets.dart';
// import 'package:ecommerce/widgets_common/button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/widgets_common/custom_textfield.dart' as custom;
// import '../signup_page/signup_page.dart';
//
// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(AuthController());
//
//     return bgWidgets(
//       child: Scaffold(
//         resizeToAvoidBottomInset: true, // Allows the screen to avoid overflow when the keyboard is up
//         body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 (context.screenHeight * 0.06).heightBox, // Spacer to position logo correctly
//                 applogoWidgets(), // App logo widget
//                 10.heightBox, // Spacer
//                 "Log in to $appname".text.fontFamily(bold).size(18).white.make(), // Login title
//                 15.heightBox, // Spacer
//                 Obx(
//                       () => Column(
//                     children: [
//                       // Email TextField
//                       custom.customTextField(
//                         title: email,
//                         hint: emailHint,
//                         isPass: false,
//                         controller: controller.emailController,
//                       ),
//                       20.heightBox, // Spacer
//                       // Password TextField
//                       custom.customTextField(
//                         title: password,
//                         hint: passwordHint,
//                         isPass: true,
//                         controller: controller.passwordController,
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: TextButton(
//                           onPressed: () {}, // Forgot password functionality can be added later
//                           child: forgetPassword.text.make(),
//                         ),
//                       ),
//                       5.heightBox, // Spacer
//                       // Login Button with Loading Indicator
//                       controller.isLoading.value
//                           ? const CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation(redColor),
//                       )
//                           : Button(
//                         color: redColor,
//                         title: login,
//                         textColor: whiteColor,
//                         onPress: () async {
//                           controller.isLoading(true);
//                           await controller.loginMethod(context: context).then((value) {
//                             if (value != null) {
//                               VxToast.show(context, msg: loggedin);
//                               Get.offAll(() => const Home()); // Navigate to home page on success
//                             } else {
//                               controller.isLoading(false); // Reset loading state if login fails
//                             }
//                           });
//                         },
//                       ).box.width(context.screenWidth).make(),
//                       15.heightBox, // Spacer
//                       createNewAccount.text.color(fontGrey).make(), // Create new account text
//                       15.heightBox, // Spacer
//                       // Signup Button
//                       Button(
//                         color: lightGolden,
//                         title: signup,
//                         textColor: redColor,
//                         onPress: () {
//                           Get.to(() => const SignupPage()); // Navigate to signup page
//                         },
//                       ).box.width(context.screenWidth).make(),
//                       20.heightBox, // Spacer
//                       loginWith.text.color(fontGrey).make(), // Social login title
//                       15.heightBox, // Spacer
//                       // Social Media Icons
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(
//                           3,
//                               (index) => Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CircleAvatar(
//                               radius: 25,
//                               backgroundColor: lightGrey,
//                               child: Image.asset(
//                                 socialIconList[index],
//                                 width: 30,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                       .box
//                       .white
//                       .rounded
//                       .padding(const EdgeInsets.all(16)) // Padding for input fields container
//                       .width(context.screenWidth - 70) // Reduced width for better UI
//                       .shadowMax // Added shadow for elevated look
//                       .make(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
































import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/consts/iconList.dart';
import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/pages/home_page/home/home.dart';
import 'package:ecommerce/widgets_common/applogo_widgets.dart';
import 'package:ecommerce/widgets_common/bg_widgets.dart';
import 'package:ecommerce/widgets_common/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/widgets_common/custom_textfield.dart' as custom;

import '../signup_page/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidgets(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Ensures bottom insets for keyboard don't affect layout
        body: Center(
          child: SingleChildScrollView( // Add this for scrollable login form
            child: Column(
              children: [
                (context.screenHeight * 0.06).heightBox,
                applogoWidgets(),
                10.heightBox,
                "Log in to $appname".text.fontFamily(bold).size(18).white.make(),
                15.heightBox,
                Obx(
                      () => Column(
                    children: [
                      // Email TextField
                      custom.customTextField(
                          title: email,
                          hint: emailHint,
                          isPass: false,
                          controller: controller.emailController),
                      20.heightBox,
                      // Password TextField
                      custom.customTextField(
                          title: password,
                          hint: passwordHint,
                          isPass: true,
                          controller: controller.passwordController),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Add your forgot password logic here
                          },
                          child: forgetPassword.text.make(),
                        ),
                      ),
                      5.heightBox,
                      controller.isLoading.value
                          ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                          : Button(
                          color: redColor,
                          title: login,
                          textColor: whiteColor,
                          onPress: () async {
                            // Validate input before attempting login
                            if (controller.emailController.text.isEmpty ||
                                controller.passwordController.text.isEmpty) {
                              VxToast.show(context, msg: "All fields are required.");
                              return;
                            }

                            controller.isLoading(true);

                            try {
                              await controller.loginMethod(context: context).then((value) {
                                if (value != null) {
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(() => const Home());
                                } else {
                                  controller.isLoading(false);
                                  VxToast.show(context, msg: "Invalid credentials, try again.");
                                }
                              });
                            } catch (e) {
                              // Handle Firebase Auth-specific errors
                              VxToast.show(context, msg: "Error: ${e.toString()}");
                              controller.isLoading(false);
                            }
                          }
                      ).box.width(context.screenWidth).make(),
                      15.heightBox,
                      createNewAccount.text.color(fontGrey).make(),
                      15.heightBox,
                      Button(
                          color: lightGolden,
                          title: signup,
                          textColor: redColor,
                          onPress: () {
                            Get.to(() => const SignupPage());
                          }
                      ).box.width(context.screenWidth).make(),
                      20.heightBox,
                      loginWith.text.color(fontGrey).make(),
                      15.heightBox,
                      // Social media login icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: lightGrey,
                            child: Image.asset(
                              socialIconList[index],
                              width: 30,
                            ),
                          ),
                        )
                        ),
                      ),
                    ],
                  )
                      .box
                      .white
                      .rounded
                      .padding(const EdgeInsets.all(16))
                      .width(context.screenWidth - 70)
                      .shadowMax
                      .make(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
