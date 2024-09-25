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
    // controller.passController.text = data['password'];

    return bgWidgets(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 90,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()
                :
                data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                    ? Image.network(data['imageUrl'],width: 100,
                  fit: BoxFit.cover,)

                : Image.file(
                    File(controller.profileImgPath.value),
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            Button(
                title: "Change",
                color: redColor,
                textColor: whiteColor,
                onPress: () {
                  controller.changeImage(context);
                }),
            const Divider(),
            20.heightBox,
            customTextField(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false),
10.heightBox,
            customTextField(
                controller: controller.oldpassController,
                hint: passwordHint,
                title: oldpass,
                isPass: true),
10.heightBox,
            customTextField(
                controller: controller.newpassController,
                hint: passwordHint,
                title: newpass,
                isPass: true),

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

            if(controller.profileImgPath.value.isNotEmpty){
              await controller.uploadProfileImage();
            }else{
              controller.profileImgLink = data['imageUrl'];
            }


            if(data['password'] == controller.oldpassController.text){

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
              VxToast.show(context, msg: "Updated");
            }else{
              VxToast.show(context, msg: 'Wrong Old Password');
              controller.isloading(false);
            }



            // controller.isloading(true);
            // try {
            //   // Upload profile image
            //   await controller.uploadProfileImage();
            //
            //   // Update profile information
            //   await controller.profileUpdate(
            //       imageUrl: controller.profileImgLink,
            //       name: controller.nameController.text,
            //       password: controller.passController.text
            //   );
            //
            //   // Show success message
            //   VxToast.show(context, msg: 'Profile updated successfully');
            // } catch (e) {
            //   // Handle errors (you can show a toast or error message)
            //   VxToast.show(context, msg: 'An error occurred: $e');
            // } finally {
            //   // Set loading to false after the operation completes
            //   controller.isloading(false);
            // }
          },
        ),),

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
    ));
  }
}

// import 'dart:io';
//
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/controller/profile_controller.dart';
// import 'package:ecommerce/widgets_common/bg_widgets.dart';
// import 'package:ecommerce/widgets_common/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class EditProfilePage extends StatelessWidget {
//   final dynamic data;
//   const EditProfilePage({super.key, this.data});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<ProfileController>();
//     controller.nameController.text = data['name'];
//     controller.passController.text = data['password'];
//
//     // if (data!= null) {
//     //   var nameC = data['name'];
//     //   print(nameC);
//     //   // controller.nameController.text = nameC;
//     //   // controller.passController.text = data['password'];
//     // } else {
//     //   // Handle the case where data is null
//     //   print("Data is null");
//     // }
//
//
//     return bgWidgets(
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Obx(()=> Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               controller.profileImgPath.isEmpty
//                   ? Image.asset(
//                       imgProfile2,
//                       width: 90,
//                       fit: BoxFit.cover,
//                     ).box.roundedFull.clip(Clip.antiAlias).make()
//                   : Image.file(
//                   File(controller.profileImgPath.value),
//                 width: 100,
//                 fit: BoxFit.cover,
//               ).box.roundedFull.clip(Clip.antiAlias).make(),
//               10.heightBox,
//               // Button(color: redColor,onPress: (){}, textColor: whiteColor,title: 'Edit'),
//               OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor: redColor,
//                   side: BorderSide.none, // remove border
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.zero), // make it rectangular
//                 ),
//                 onPressed: () {
//                   controller.changeImage(context);
//                 },
//                 child: Text(
//                   'Edit',
//                   style: TextStyle(color: whiteColor),
//                 ),
//               ),
//               Divider(),
//               20.heightBox,
//               customTextField(
//                 controller: controller.nameController,
//                   hint: nameHint,
//                   title: name,
//                   isPass: false
//               ),
//               customTextField(
//                 controller: controller.passController,
//                   hint: password,
//                   title: password,
//                   isPass: true
//               ),
//               10.heightBox,
//               SizedBox(
//                 width: context.screenWidth,
//                 child: OutlinedButton(
//                   style: OutlinedButton.styleFrom(
//                     backgroundColor: redColor,
//                     side: BorderSide.none, // remove border
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.zero), // make it rectangular
//                   ),
//                   onPressed: () {},
//                   child: Text(
//                     'Save',
//                     style: TextStyle(color: whiteColor),
//                   ),
//                 ),
//               ),
//             ],
//           )
//               .box
//               .white
//               .shadowSm
//               .padding(EdgeInsets.all(20))
//               .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
//               .rounded
//               .make(),
//         ),
//       ),
//     );
//   }
// }

//
// import 'dart:io';
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/controller/profile_controller.dart';
// import 'package:ecommerce/widgets_common/bg_widgets.dart';
// import 'package:ecommerce/widgets_common/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class EditProfilePage extends StatelessWidget {
//   final dynamic data;
//   const EditProfilePage({super.key, this.data});
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.find<ProfileController>();
//     // controller.nameController.text = data['name'];
//     // controller.passController.text = data['password'];
//
//     if (data != null) {
//       dataName = "${data['name']}";
//       print(dataName);
//       controller.nameController.text = data['name'];
//       controller.passController.text = data['password'];
//     } else {
//       // Handle the case where data is null
//       print("Data is null");
//     }
//
//     return bgWidgets(
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Obx(() => Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             controller.profileImgPath.isEmpty
//                 ? Image.asset(
//               imgProfile2,
//               width: 90,
//               fit: BoxFit.cover,
//             ).box.roundedFull.clip(Clip.antiAlias).make()
//                 : Image.file(
//               File(controller.profileImgPath.value),
//               width: 100,
//               fit: BoxFit.cover,
//             ).box.roundedFull.clip(Clip.antiAlias).make(),
//             10.heightBox,
//             OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                 backgroundColor: redColor,
//                 side: BorderSide.none, // remove border
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero), // make it rectangular
//               ),
//               onPressed: () {
//                 controller.changeImage(context);
//               },
//               child: const Text(
//                 'Edit',
//                 style: TextStyle(color: whiteColor),
//               ),
//             ),
//             const Divider(),
//             20.heightBox,
//             customTextField(
//               controller: controller.nameController,
//               hint: nameHint,
//               title: name,
//               isPass: false,
//             ),
//             customTextField(
//               controller: controller.passController,
//               hint: password,
//               title: password,
//               isPass: true,
//             ),
//             10.heightBox,
//             SizedBox(
//               width: context.screenWidth,
//               child: OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor: redColor,
//                   side: BorderSide.none, // remove border
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.zero), // make it rectangular
//                 ),
//                 onPressed: () {},
//                 child: const Text(
//                   'Save',
//                   style: TextStyle(color: whiteColor),
//                 ),
//               ),
//             ),
//           ],
//         ).box.white.shadowSm.padding(const EdgeInsets.all(20)).margin(const EdgeInsets.only(top: 50, left: 12, right: 12)).rounded.make()),
//       ),
//     );
//   }
// }

//
// import 'dart:io';
// import 'package:ecommerce/consts/consts.dart';
// import 'package:ecommerce/controller/profile_controller.dart';
// import 'package:ecommerce/widgets_common/bg_widgets.dart';
// import 'package:ecommerce/widgets_common/custom_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class EditProfilePage extends StatelessWidget {
//   final dynamic data;
//   const EditProfilePage({super.key, this.data});
//
//   @override
//   Widget build(BuildContext context) {
//     var controller = Get.put(ProfileController()); // Initialize the controller
//
//     if (data!= null) {
//       // var dataName = "${data['name']}";
//       // print(dataName);
//       controller.nameController.text = data['name'];
//       controller.passController.text = data['password'];
//     } else {
//       // Handle the case where data is null
//       print("Data is null");
//     }
//
//     return bgWidgets(
//       child: Scaffold(
//         appBar: AppBar(),
//         body: Obx(() => Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             controller.profileImgPath.isEmpty
//                 ? Image.asset(
//               imgProfile2,
//               width: 90,
//               fit: BoxFit.cover,
//             ).box.roundedFull.clip(Clip.antiAlias).make()
//                 : Image.file(
//               File(controller.profileImgPath.value),
//               width: 100,
//               fit: BoxFit.cover,
//             ).box.roundedFull.clip(Clip.antiAlias).make(),
//             10.heightBox,
//             OutlinedButton(
//               style: OutlinedButton.styleFrom(
//                 backgroundColor: redColor,
//                 side: BorderSide.none, // remove border
//                 shape: const RoundedRectangleBorder(
//                     borderRadius: BorderRadius.zero), // make it rectangular
//               ),
//               onPressed: () {
//                 controller.changeImage(context);
//               },
//               child: const Text(
//                 'Edit',
//                 style: TextStyle(color: whiteColor),
//               ),
//             ),
//             const Divider(),
//             20.heightBox,
//             customTextField(
//               controller: controller.nameController,
//               hint: nameHint,
//               title: name,
//               isPass: false,
//             ),
//             customTextField(
//               controller: controller.passController,
//               hint: password,
//               title: password,
//               isPass: true,
//             ),
//             10.heightBox,
//             SizedBox(
//               width: context.screenWidth,
//               child: OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   backgroundColor: redColor,
//                   side: BorderSide.none, // remove border
//                   shape: const RoundedRectangleBorder(
//                       borderRadius: BorderRadius.zero), // make it rectangular
//                 ),
//                 onPressed: () {},
//                 child: const Text(
//                   'Save',
//                   style: TextStyle(color: whiteColor),
//                 ),
//               ),
//             ),
//           ],
//         ).box.white.shadowSm.padding(const EdgeInsets.all(20)).margin(const EdgeInsets.only(top: 50, left: 12, right: 12)).rounded.make()),
//       ),
//     );
//   }
// }
