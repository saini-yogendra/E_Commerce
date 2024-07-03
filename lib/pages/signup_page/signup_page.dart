import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/auth_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/iconList.dart';
import '../../widgets_common/applogo_widgets.dart';
import '../../widgets_common/bg_widgets.dart';
import '../../widgets_common/button.dart';
import '../../widgets_common/custom_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool? isCheck = false;
  var controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidgets(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.06).heightBox,
                applogoWidgets(),
                10.heightBox,
                "Log in to $appname".text.fontFamily(bold).size(18).white.make(),
                15.heightBox,
                Column(
                  children: [
                    customTextField(title: name, hint: nameHint,controller: nameController),
                    10.heightBox,
                    customTextField(title: email, hint: emailHint,controller: emailController),
                    10.heightBox,
                    customTextField(title: password, hint: passwordHint,controller: passwordController),
                    10.heightBox,
                    customTextField(title: password, hint: retypePassword,controller: passwordRetypeController),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {}, child: forgetPassword.text.make())),

                    15.heightBox,
                    Row(
                      children: [
                        Checkbox(
                          checkColor: redColor,
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          },
                        ),
                        Expanded(
                          child: RichText(
                              text: const TextSpan(children: [
                                TextSpan(
                                  text: "I agree to the ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  ),
                                ),
                                TextSpan(
                                  text: termAndCondition,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                                TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: fontGrey,
                                  ),
                                ),
                                TextSpan(
                                  text: privacyAndPolicy,
                                  style: TextStyle(
                                    fontFamily: regular,
                                    color: redColor,
                                  ),
                                ),
                              ])),
                        )
                      ],
                    ),
                    5.heightBox,
                    // Button().box.width(context.screenWidth -50).make(),
                    Button(
                        color: isCheck == true? redColor : lightGolden,
                        title: signup,
                        textColor: isCheck == true? whiteColor : Colors.black,
                        onPress: () async{
                          if(isCheck!=false){
                              try {
                                await controller.signMethod(context: context,email: emailController.text,password: passwordController.text).then((value)){
                                                                controller.storeUserData();
                                                              };
                              } catch (e) {
                                print(e);
                              }
                          }
                        })
                        .box
                        .width(context.screenWidth)
                        .make(),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        allresdyHaveAccount.text.color(fontGrey).make(),
                        login.text.color(redColor).make().onTap(() {
                          Get.back();
                        }),
                      ],
                    )
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .width(context.screenWidth - 50)
                    .shadowMax
                    .make(),
              ],
            ),
          ),
        ));
  }
}




//
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/controller/auth_controller.dart';
// import 'package:ecommerce/pages/home_page/home/home.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../consts/iconList.dart';
// import '../../widgets_common/applogo_widgets.dart';
// import '../../widgets_common/bg_widgets.dart';
// import '../../widgets_common/button.dart';
// import '../../widgets_common/custom_textfield.dart';
//
// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});
//
//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   bool isCheck = false;
//   final AuthController controller = Get.put(AuthController());
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController passwordRetypeController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return bgWidgets(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Center(
//           child: Column(
//             children: [
//               (context.screenHeight * 0.06).heightBox,
//               applogoWidgets(),
//               10.heightBox,
//               "Log in to $appname".text.fontFamily(bold).size(18).white.make(),
//               15.heightBox,
//               Column(
//                 children: [
//                   customTextField(title: name, hint: nameHint, controller: nameController,isPass: false),
//                   10.heightBox,
//                   customTextField(title: email, hint: emailHint, controller: emailController,isPass: false),
//                   10.heightBox,
//                   customTextField(title: password, hint: passwordHint, controller: passwordController,isPass: true),
//                   10.heightBox,
//                   customTextField(title: password, hint: retypePassword, controller: passwordRetypeController,isPass: true),
//                   Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                           onPressed: () {}, child: forgetPassword.text.make())),
//
//                   15.heightBox,
//                   Row(
//                     children: [
//                       Checkbox(
//                         checkColor: redColor,
//                         value: isCheck,
//                         onChanged: (newValue) {
//                           setState(() {
//                             isCheck = newValue!;
//                           });
//                         },
//                       ),
//                       Expanded(
//                         child: RichText(
//                             text: const TextSpan(children: [
//                               TextSpan(
//                                 text: "I agree to the ",
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: fontGrey,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: termAndCondition,
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: redColor,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: " & ",
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: fontGrey,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: privacyAndPolicy,
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: redColor,
//                                 ),
//                               ),
//                             ])),
//                       )
//                     ],
//                   ),
//                   5.heightBox,
//                   Button(
//                       color: isCheck ? redColor : lightGolden,
//                       title: signup,
//                       textColor: isCheck ? whiteColor : Colors.black,
//                       onPress: () async {
//                         if (isCheck) {
//                           try {
//                             await controller.signMethod(
//                                 context: context,
//                                 email: emailController.text,
//                                 password: passwordController.text).then((value) {
//                               controller.storeUserData(
//                                 email: emailController.text,
//                                 password: passwordController.text,
//                                 name: nameController
//                               );
//                             }).then((value) {
//                               VxToast.show(context, msg: loggedin);
//                               Get.offAll(() => Home());
//                             });
//                           } catch (e) {
//                             auth.signOut();
//                             VxToast.show(context, msg: e.toString());
//                           }
//                         }
//                       }).box.width(context.screenWidth).make(),
//                   10.heightBox,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       allresdyHaveAccount.text.color(fontGrey).make(),
//                       login.text.color(redColor).make().onTap(() {
//                         Get.back();
//                       }),
//                     ],
//                   )
//                 ],
//               ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth - 50).shadowMax.make(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }







//
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/controller/auth_controller.dart';
// import 'package:ecommerce/pages/home_page/home/home.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vxstate/vxstate.dart';
//
// import '../../consts/iconList.dart';
// import '../../widgets_common/applogo_widgets.dart';
// import '../../widgets_common/bg_widgets.dart';
// import '../../widgets_common/button.dart';
// import '../../widgets_common/custom_textfield.dart';
//
// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});
//
//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   bool isCheck = false;
//   final AuthController controller = Get.put(AuthController());
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController passwordRetypeController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return bgWidgets(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Center(
//           child: Column(
//             children: [
//               (context.screenHeight * 0.06).heightBox,
//               applogoWidgets(),
//               10.heightBox,
//               "Log in to $appname".text.fontFamily(bold).size(18).white.make(),
//               15.heightBox,
//               Column(
//                 children: [
//                   customTextField(title: name, hint: nameHint, controller: nameController, isPass: false),
//                   10.heightBox,
//                   customTextField(title: email, hint: emailHint, controller: emailController, isPass: false),
//                   10.heightBox,
//                   customTextField(title: password, hint: passwordHint, controller: passwordController, isPass: true),
//                   10.heightBox,
//                   customTextField(title: password, hint: retypePassword, controller: passwordRetypeController, isPass: true),
//                   Align(
//                       alignment: Alignment.centerRight,
//                       child: TextButton(
//                           onPressed: () {}, child: forgetPassword.text.make())),
//
//                   15.heightBox,
//                   Row(
//                     children: [
//                       Checkbox(
//                         checkColor: redColor,
//                         value: isCheck,
//                         onChanged: (newValue) {
//                           setState(() {
//                             isCheck = newValue!;
//                           });
//                         },
//                       ),
//                       Expanded(
//                         child: RichText(
//                             text: const TextSpan(children: [
//                               TextSpan(
//                                 text: "I agree to the ",
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: fontGrey,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: termAndCondition,
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: redColor,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: " & ",
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: fontGrey,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: privacyAndPolicy,
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: redColor,
//                                 ),
//                               ),
//                             ])),
//                       )
//                     ],
//                   ),
//                   5.heightBox,
//                   Button(
//                       color: isCheck ? redColor : lightGolden,
//                       title: signup,
//                       textColor: isCheck ? whiteColor : Colors.black,
//                       onPress: () async {
//                         if (isCheck) {
//                           try {
//                             await controller.signMethod(
//                                 context: context,
//                                 email: emailController.text,
//                                 password: passwordController.text).then((value) {
//                               controller.storeUserData(
//                                 email: emailController.text,
//                                 password: passwordController.text,
//                                 name: nameController.text,
//                               );
//                             }).then((value) {
//                               VxToast.show(context, msg: loggedin);
//                               Get.offAll(() => Home());
//                             });
//                           } catch (e) {
//                             auth.signOut();
//                             VxToast.show(context, msg: e.toString());
//                           }
//                         }
//                       }).box.width(context.screenWidth).make(),
//                   10.heightBox,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       allresdyHaveAccount.text.color(fontGrey).make(),
//                       login.text.color(redColor).make().onTap(() {
//                         Get.back();
//                       }),
//                     ],
//                   )
//                 ],
//               ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth - 50).shadowMax.make(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/controller/auth_controller.dart';
// import 'package:ecommerce/pages/home_page/home/home.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vxstate/vxstate.dart';
//
// import '../../consts/iconList.dart';
// import '../../widgets_common/applogo_widgets.dart';
// import '../../widgets_common/bg_widgets.dart';
// import '../../widgets_common/button.dart';
// import '../../widgets_common/custom_textfield.dart';
//
// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});
//
//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }
//
// class _SignupPageState extends State<SignupPage> {
//   bool isCheck = false;
//   final AuthController controller = Get.put(AuthController());
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController passwordRetypeController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return bgWidgets(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Center(
//           child: Column(
//             children: [
//               (context.screenHeight * 0.06).heightBox,
//               applogoWidgets(),
//               10.heightBox,
//               "Log in to $appname".text.fontFamily(bold).size(18).white.make(),
//               15.heightBox,
//               Column(
//                 children: [
//                   customTextField(
//                     title: name,
//                     hint: nameHint,
//                     controller: nameController,
//                     isPass: false,
//                   ),
//                   10.heightBox,
//                   customTextField(
//                     title: email,
//                     hint: emailHint,
//                     controller: emailController,
//                     isPass: false,
//                   ),
//                   10.heightBox,
//                   customTextField(
//                     title: password,
//                     hint: passwordHint,
//                     controller: passwordController,
//                     isPass: true,
//                   ),
//                   10.heightBox,
//                   customTextField(
//                     title: password,
//                     hint: retypePassword,
//                     controller: passwordRetypeController,
//                     isPass: true,
//                   ),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: TextButton(
//                         onPressed: () {},
//                         child: forgetPassword.text.make()
//                     ),
//                   ),
//                   15.heightBox,
//                   Row(
//                     children: [
//                       Checkbox(
//                         checkColor: redColor,
//                         value: isCheck,
//                         onChanged: (newValue) {
//                           setState(() {
//                             isCheck = newValue!;
//                           });
//                         },
//                       ),
//                       Expanded(
//                         child: RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "I agree to the ",
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: fontGrey,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: termAndCondition,
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: redColor,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: " & ",
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: fontGrey,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: privacyAndPolicy,
//                                 style: TextStyle(
//                                   fontFamily: regular,
//                                   color: redColor,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   5.heightBox,
//                   Button(
//                     color: isCheck ? redColor : lightGolden,
//                     title: signup,
//                     textColor: isCheck ? whiteColor : Colors.black,
//                     onPress: () async {
//                       if (isCheck) {
//                         try {
//                           await controller.signMethod(
//                             context: context,
//                             email: emailController.text,
//                             password: passwordController.text,
//                           ).then((value) {
//                             controller.storeUserData(
//                               email: emailController.text,
//                               password: passwordController.text,
//                               name: nameController.text,
//                             );
//                           }).then((value) {
//                             VxToast.show(context, msg: loggedin);
//                             Get.offAll(() => Home());
//                           });
//                         } catch (e) {
//                           auth.signOut();
//                           VxToast.show(context, msg: e.toString());
//                         }
//                       }
//                     },
//                   ).box.width(context.screenWidth).make(),
//                   10.heightBox,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       allresdyHaveAccount.text.color(fontGrey).make(),
//                       login.text.color(redColor).make().onTap(() {
//                         Get.back();
//                       }),
//                     ],
//                   )
//                 ],
//               ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth - 50).shadowMax.make(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }