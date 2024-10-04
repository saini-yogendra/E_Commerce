//  import 'dart:io';
//
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/controller/profile_controller.dart';
// import 'package:ecommerce/widgets_common/bg_widgets.dart';
// import 'package:ecommerce/widgets_common/button.dart';
// import 'package:ecommerce/widgets_common/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class EditProfilePage extends StatelessWidget {
//   final dynamic data;
//
//   const EditProfilePage({super.key, this.data});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<ProfileController>();
//     controller.nameController.text = data['name'];
//     // controller.passController.text = data['password'];
//
//     return bgWidgets(
//         child: Scaffold(
//       appBar: AppBar(),
//       body: Obx(
//         () => Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             data['imageUrl'] == '' && controller.profileImgPath.isEmpty
//                 ? Image.asset(
//                     imgProfile2,
//                     width: 90,
//                     fit: BoxFit.cover,
//                   ).box.roundedFull.clip(Clip.antiAlias).make()
//                 :
//                 data['imageUrl'] == '' && controller.profileImgPath.isEmpty
//                     ? Image.network(data['imageUrl'],width: 100,
//                   fit: BoxFit.cover,)
//
//                 : Image.file(
//                     File(controller.profileImgPath.value),
//                     width: 100,
//                     fit: BoxFit.cover,
//                   ).box.roundedFull.clip(Clip.antiAlias).make(),
//             10.heightBox,
//             Button(
//                 title: "Change",
//                 color: redColor,
//                 textColor: whiteColor,
//                 onPress: () {
//                   controller.changeImage(context);
//                 }),
//             const Divider(),
//             20.heightBox,
//             customTextField(
//                 controller: controller.nameController,
//                 hint: nameHint,
//                 title: name,
//                 isPass: false),
// 10.heightBox,
//             customTextField(
//                 controller: controller.oldpassController,
//                 hint: passwordHint,
//                 title: oldpass,
//                 isPass: true),
// 10.heightBox,
//             customTextField(
//                 controller: controller.newpassController,
//                 hint: passwordHint,
//                 title: newpass,
//                 isPass: true),
//
//             20.heightBox,
//       controller.isloading.value
//           ? const CircularProgressIndicator(
//         valueColor: AlwaysStoppedAnimation(redColor),
//       )
//           : SizedBox(
//         width: context.screenWidth - 60,
//         child: Button(
//           title: "Save",
//           color: redColor,
//           textColor: whiteColor,
//           onPress: () async {
//
//
//
//             controller.isloading(true);
//
//             if(controller.profileImgPath.value.isNotEmpty){
//               await controller.uploadProfileImage();
//             }else{
//               controller.profileImgLink = data['imageUrl'];
//             }
//
//
//             if(data['password'] == controller.oldpassController.text){
//
//               await controller.changeAuthPassword(
//                 email: data['email'],
//                 password: controller.oldpassController.text,
//                 newpassword: controller.newpassController.text,
//
//               );
//               await controller.profileUpdate(
//                 imageUrl: controller.profileImgLink,
//                 name: controller.nameController.text,
//                 password: controller.newpassController.text,
//               );
//               VxToast.show(context, msg: "Updated");
//             }else{
//               VxToast.show(context, msg: 'Wrong Old Password');
//               controller.isloading(false);
//             }
//
//
//
//             // controller.isloading(true);
//             // try {
//             //   // Upload profile image
//             //   await controller.uploadProfileImage();
//             //
//             //   // Update profile information
//             //   await controller.profileUpdate(
//             //       imageUrl: controller.profileImgLink,
//             //       name: controller.nameController.text,
//             //       password: controller.passController.text
//             //   );
//             //
//             //   // Show success message
//             //   VxToast.show(context, msg: 'Profile updated successfully');
//             // } catch (e) {
//             //   // Handle errors (you can show a toast or error message)
//             //   VxToast.show(context, msg: 'An error occurred: $e');
//             // } finally {
//             //   // Set loading to false after the operation completes
//             //   controller.isloading(false);
//             // }
//           },
//         ),),
//
//       ],
//         )
//             .box
//             .white
//             .shadowSm
//             .padding(const EdgeInsets.all(16))
//             .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
//             .rounded
//             .make(),
//       ),
//     ));
//   }
// }













import 'dart:io';

import 'package:ecommerce/consts/consts.dart';
import 'package:ecommerce/controller/profile_controller.dart';
import 'package:ecommerce/widgets_common/bg_widgets.dart';
import 'package:ecommerce/widgets_common/button.dart';
import 'package:ecommerce/widgets_common/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  final dynamic data;

  const EditProfilePage({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];

    return bgWidgets(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Obx(
              () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Profile image logic correction
              if (data['imageUrl'] != '' && controller.profileImgPath.isEmpty)
                Image.network(
                  data['imageUrl'],
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make()
              else if (controller.profileImgPath.isNotEmpty)
                Image.file(
                  File(controller.profileImgPath.value),
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make()
              else
                Image.asset(
                  imgProfile2,
                  width: 90,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              Button(
                title: "Change",
                color: redColor,
                textColor: whiteColor,
                onPress: () {
                  controller.changeImage(context);
                },
              ),
              const Divider(),
              20.heightBox,
              customTextField(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false,
              ),
              10.heightBox,
              customTextField(
                controller: controller.oldpassController,
                hint: passwordHint,
                title: oldpass,
                isPass: true,
              ),
              10.heightBox,
              customTextField(
                controller: controller.newpassController,
                hint: passwordHint,
                title: newpass,
                isPass: true,
              ),
              20.heightBox,
              controller.isloading.value
                  ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              )
                  : SizedBox(
                width: context.screenWidth - 60,
                child: Button(
                  title: "Save",
                  color: redColor,
                  textColor: whiteColor,
                  onPress: () async {
                    controller.isloading(true);

                    try {
                      // Upload profile image if selected
                      if (controller.profileImgPath.value.isNotEmpty) {
                        await controller.uploadProfileImage();
                      } else {
                        controller.profileImgLink = data['imageUrl'];
                      }

                      // Check if old password matches
                      if (data['password'] == controller.oldpassController.text) {
                        // Update password and profile details
                        await controller.changeAuthPassword(
                          email: data['email'],
                          password: controller.oldpassController.text,
                          newpassword: controller.newpassController.text,
                        );
                        await controller.profileUpdate(
                          imageUrl: controller.profileImgLink,
                          name: controller.nameController.text,
                          password: controller.newpassController.text,
                        );
                        VxToast.show(context, msg: "Profile Updated");
                      } else {
                        VxToast.show(context, msg: 'Incorrect Old Password');
                      }
                    } catch (e) {
                      VxToast.show(context, msg: 'An error occurred: $e');
                    } finally {
                      controller.isloading(false);
                    }
                  },
                ),
              ),
            ],
          )
              .box
              .white
              .shadowSm
              .padding(const EdgeInsets.all(16))
              .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
              .rounded
              .make(),
        ),
      ),
    );
  }
}
