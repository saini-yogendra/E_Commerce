import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/auth_controller.dart';
import 'package:ecommerce/pages/home_page/home/home.dart';
import 'package:ecommerce/widgets_common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets_common/applogo_widgets.dart';
import '../../widgets_common/bg_widgets.dart';
import '../../widgets_common/button.dart';

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
                Obx(
                      ()=> Column(
                    children: [
                      customTextField(
                          hint: nameHint,
                          title: name,
                          controller: nameController,isPass: false),
                      10.heightBox,
                      customTextField(
                          hint: emailHint,
                          title: email,
                          controller: emailController,isPass: false),
                      10.heightBox,
                      customTextField(
                          hint: passwordHint,
                          title: password,
                          controller: passwordController,isPass: true),
                      10.heightBox,
                      customTextField(
                          hint: retypePassword,
                          title: password,
                          controller: passwordRetypeController,isPass: true),
                      // Align(
                      //     alignment: Alignment.centerRight,
                      //     child: TextButton(
                      //         onPressed: () {},
                      //         child: forgetPassword.text.make())),
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
                      controller.isLoading.value ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ) :
                      Button(
                          color: isCheck == true ? redColor : lightGolden,
                          title: signup,
                          textColor: isCheck == true ? whiteColor : Colors.black,
                          onPress: () async {
                            if (isCheck != false) {
                              controller.isLoading(true);
                              try {
                                await controller
                                    .signupMethod(
                                    context: context,
                                    email: emailController.text,
                                    password: passwordController.text,
                                ).then((value) {
                                  return controller.storeUserData(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      name: nameController.text
                                  );
                                }).then((value) {
                                  VxToast.show(context, msg: loggedin);
                                  Get.offAll(() => const Home());
                                });
                              } catch (e) {
                                auth.signOut();
                                VxToast.show(context, msg: e.toString());
                                controller.isLoading(false);
                              }
                            }
                          },
                      ).box.width(context.screenWidth - 50).make(),
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
                      .padding(const EdgeInsets.all(16))
                      .width(context.screenWidth - 50)
                      .shadowSm
                      .make(),
                ),
              ],
            ),
          ),
        ));
  }
}

