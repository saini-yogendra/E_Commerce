  // import 'package:cloud_firestore/cloud_firestore.dart';
  // import 'package:ecommerce/consts/consts.dart';
  // import 'package:ecommerce/consts/iconList.dart';
  // import 'package:ecommerce/controller/auth_controller.dart';
  // import 'package:ecommerce/controller/profile_controller.dart';
  // import 'package:ecommerce/pages/home_page/account_page/components/details_cards.dart';
  // import 'package:ecommerce/pages/home_page/account_page/edit_profile_page.dart';
  // import 'package:ecommerce/pages/login_page/login_page.dart';
  // import 'package:ecommerce/services/firestore_services.dart';
  // import 'package:ecommerce/widgets_common/bg_widgets.dart';
  // import 'package:flutter/material.dart';
  // import 'package:get/get.dart';
  //
  // class AccountPage extends StatelessWidget {
  //   const AccountPage({super.key});
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     Get.put(ProfileController());
  //     return bgWidgets(
  //         child: Scaffold(
  //             body: StreamBuilder(
  //                 stream: FirestoreServices.getUser(currentUser!.uid),
  //                 builder: (BuildContext context,
  //                     AsyncSnapshot<QuerySnapshot> snapshot) {
  //                   if (!snapshot.hasData) {
  //                     return const Center(
  //                       child: CircularProgressIndicator(
  //                         valueColor: AlwaysStoppedAnimation(redColor),
  //                       ),
  //                     );
  //                   } else if (snapshot.hasError) {
  //                     return const Icon(Icons.error_outline);
  //                   } else {
  //                     var data = snapshot.data!.docs[0];
  //                     return SafeArea(
  //                       child: Column(
  //                         children: [
  //                           Padding(
  //                             padding: const EdgeInsets.all(8.0),
  //                             child: Align(
  //                               alignment: Alignment.topRight,
  //                               child: GestureDetector(
  //                                 onTap: () {
  //                                   Get.to(() => EditProfilePage(
  //                                         data: data,
  //                                       ));
  //                                 },
  //                                 child: Row(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   children: [
  //                                     // const Text('Edit').text.white.fontFamily(semibold).make(),
  //                                     GestureDetector(
  //                                       onTap: () {
  //                                         // add your onPressed function for the Text widget here
  //                                         Get.to(() => EditProfilePage(
  //                                               data: data,
  //                                             ));
  //                                       },
  //                                       child: const Text('Edit')
  //                                           .text
  //                                           .white
  //                                           .fontFamily(semibold)
  //                                           .make(),
  //                                     ),
  //                                     const SizedBox(
  //                                       width: 10,
  //                                     ),
  //                                     const Icon(
  //                                       Icons.edit,
  //                                       color: whiteColor,
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                             ),
  //                           )
  //                               .box
  //                               .margin(const EdgeInsets.only(right: 20, top: 10))
  //                               .make(),
  //                           Padding(
  //                             padding:
  //                                 const EdgeInsets.symmetric(horizontal: 8.0),
  //                             child: Row(
  //                               children: [
  //                                 data['imageUrl'] == ''
  //                                     ? Image.asset(
  //                                         imgProfile2,
  //                                         width: 90,
  //                                         fit: BoxFit.cover,
  //                                       )
  //                                         .box
  //                                         .margin(const EdgeInsets.only(left: 8))
  //                                         .roundedFull
  //                                         .clip(Clip.antiAlias)
  //                                         .make()
  //                                     : Image.network(data['imageUrl'],
  //                                         width: 90,
  //                                         fit: BoxFit.cover,
  //                                       )
  //                                         .box
  //                                         .margin(const EdgeInsets.only(left: 8))
  //                                         .roundedFull
  //                                         .clip(Clip.antiAlias)
  //                                         .make(),
  //                                 Expanded(
  //                                     child: Column(
  //                                   crossAxisAlignment: CrossAxisAlignment.start,
  //                                   mainAxisAlignment: MainAxisAlignment.center,
  //                                   children: [
  //                                     "${data['name']}"
  //                                         .text
  //                                         .fontFamily(semibold)
  //                                         .white
  //                                         .size(20)
  //                                         .make(),
  //                                     "${data['email']}"
  //                                         .text
  //                                         .size(12)
  //                                         .white
  //                                         .make()
  //                                   ],
  //                                 ).box.margin(const EdgeInsets.only(left: 10)).make()),
  //                                 OutlinedButton(
  //                                   style: OutlinedButton.styleFrom(
  //                                     backgroundColor: redColor,
  //                                     side: const BorderSide(color: whiteColor),
  //                                     shape: const RoundedRectangleBorder(
  //                                         borderRadius: BorderRadius.zero),
  //                                     padding: const EdgeInsets.symmetric(
  //                                         horizontal: 20,
  //                                         vertical: 10), // add padding
  //                                     foregroundColor:
  //                                         whiteColor, // make it rectangular
  //                                   ),
  //                                   onPressed: () async {
  //                                     await Get.put(AuthController()
  //                                         .signoutMethod(context));
  //                                     Get.offAll(() => const LoginPage());
  //                                   },
  //
  //                                   // onPressed: () async {
  //                                   //   final authController = Get.find<AuthController>();
  //                                   //   await authController.signoutMethod(context);
  //                                   //   Get.offAll(() => const LoginPage());
  //                                   // },
  //
  //                                   child: "Logout".text.make(),
  //                                 ).box.margin(const EdgeInsets.only(right: 10)).make()
  //                               ],
  //                             ),
  //                           ),
  //                           // 10.heightBox,
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                             children: [
  //                               detailsCard(
  //                                 count: data['cart_count'],
  //                                 title: "in your cart",
  //                                 width: context.screenWidth / 3.5,
  //                               ),
  //                               detailsCard(
  //                                 count: data['wishlist_count'],
  //                                 title: "in your wishlist",
  //                                 width: context.screenWidth / 3.5,
  //                               ),
  //                               detailsCard(
  //                                 count: data['order_count'],
  //                                 title: "in your order",
  //                                 width: context.screenWidth / 3.5,
  //                               ),
  //                             ],
  //                           ),
  //                           // SizedBox(height: 10,),
  //                           ListView.separated(
  //                             shrinkWrap: true,
  //                             separatorBuilder: (context, index) {
  //                               return const Divider(
  //                                 color: lightGrey,
  //                               );
  //                             },
  //                             itemCount: profileButtonsList.length,
  //                             itemBuilder: (BuildContext context, int index) {
  //                               return ListTile(
  //                                 leading: Image.asset(
  //                                   profileButtonIcons[index],
  //                                   width: 22,
  //                                 ),
  //                                 title: profileButtonsList[index]
  //                                     .text
  //                                     .fontFamily(semibold)
  //                                     .color(darkFontGrey)
  //                                     .make(),
  //                               );
  //                             },
  //                           )
  //                               .box
  //                               .white
  //                               .rounded
  //                               .margin(const EdgeInsets.all(12))
  //                               .padding(
  //                                   const EdgeInsets.symmetric(horizontal: 16))
  //                               .shadowMax
  //                               .make()
  //                               .box
  //                               .color(redColor)
  //                               .make()
  //                         ],
  //                       ),
  //                     );
  //                   }
  //                 })));
  //   }
  // }
  //
  //
















  //
  //
  // import 'package:cloud_firestore/cloud_firestore.dart';
  // import 'package:ecommerce/consts/consts.dart';
  // import 'package:ecommerce/consts/iconList.dart';
  // import 'package:ecommerce/controller/auth_controller.dart';
  // import 'package:ecommerce/controller/profile_controller.dart';
  // import 'package:ecommerce/pages/home_page/account_page/components/details_cards.dart';
  // import 'package:ecommerce/pages/home_page/account_page/edit_profile_page.dart';
  // import 'package:ecommerce/pages/login_page/login_page.dart';
  // import 'package:ecommerce/services/firestore_services.dart';
  // import 'package:ecommerce/widgets_common/bg_widgets.dart';
  // import 'package:flutter/material.dart';
  // import 'package:get/get.dart';
  //
  // class AccountPage extends StatelessWidget {
  //   const AccountPage({super.key});
  //
  //   @override
  //   Widget build(BuildContext context) {
  //     Get.put(ProfileController());
  //
  //     // Check if currentUser is available before using it
  //     if (currentUser == null) {
  //       return Center(
  //         child: Text(
  //           "User is not logged in.",
  //           style: TextStyle(color: whiteColor),
  //         ),
  //       );
  //     }
  //
  //     return bgWidgets(
  //       child: Scaffold(
  //         body: StreamBuilder(
  //           stream: FirestoreServices.getUser(currentUser!.uid),
  //           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //             if (snapshot.connectionState == ConnectionState.waiting) {
  //               return const Center(
  //                 child: CircularProgressIndicator(
  //                   valueColor: AlwaysStoppedAnimation(redColor),
  //                 ),
  //               );
  //             } else if (snapshot.hasError) {
  //               return const Icon(Icons.error_outline);
  //             } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
  //               return Center(
  //                 child: Text(
  //                   "No user data found.",
  //                   style: TextStyle(color: whiteColor),
  //                 ),
  //               );
  //             } else {
  //               var data = snapshot.data!.docs[0];
  //
  //               return SafeArea(
  //                 child: Column(
  //                   children: [
  //                     // Edit Profile Section
  //                     Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Align(
  //                         alignment: Alignment.topRight,
  //                         child: GestureDetector(
  //                           onTap: () {
  //                             Get.to(() => EditProfilePage(data: data));
  //                           },
  //                           child: Row(
  //                             mainAxisSize: MainAxisSize.min,
  //                             children: [
  //                               const Text('Edit')
  //                                   .text
  //                                   .white
  //                                   .fontFamily(semibold)
  //                                   .make(),
  //                               const SizedBox(width: 10),
  //                               const Icon(Icons.edit, color: whiteColor),
  //                             ],
  //                           ),
  //                         ),
  //                       ),
  //                     ).box.margin(const EdgeInsets.only(right: 20, top: 10)).make(),
  //
  //                     // Profile Section
  //                     Padding(
  //                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //                       child: Row(
  //                         children: [
  //                           data['imageUrl'] == ''
  //                               ? Image.asset(
  //                             imgProfile2,
  //                             width: 90,
  //                             fit: BoxFit.cover,
  //                           ).box.margin(const EdgeInsets.only(left: 8)).roundedFull.clip(Clip.antiAlias).make()
  //                               : Image.network(
  //                             data['imageUrl'],
  //                             width: 90,
  //                             fit: BoxFit.cover,
  //                           ).box.margin(const EdgeInsets.only(left: 8)).roundedFull.clip(Clip.antiAlias).make(),
  //                           Expanded(
  //                             child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               children: [
  //                                 "${data['name']}".text.fontFamily(semibold).white.size(20).make(),
  //                                 "${data['email']}".text.size(12).white.make()
  //                               ],
  //                             ).box.margin(const EdgeInsets.only(left: 10)).make(),
  //                           ),
  //                           // Logout Button
  //                           OutlinedButton(
  //                             style: OutlinedButton.styleFrom(
  //                               backgroundColor: redColor,
  //                               side: const BorderSide(color: whiteColor),
  //                               shape: const RoundedRectangleBorder(
  //                                 borderRadius: BorderRadius.zero,
  //                               ),
  //                               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // add padding
  //                               foregroundColor: whiteColor,
  //                             ),
  //                             onPressed: () async {
  //                               await Get.find<AuthController>().signoutMethod(context);
  //                               Get.offAll(() => const LoginPage());
  //                             },
  //                             child: "Logout".text.make(),
  //                           ).box.margin(const EdgeInsets.only(right: 10)).make(),
  //                         ],
  //                       ),
  //                     ),
  //
  //                     // Details Cards (Cart, Wishlist, Orders)
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                       children: [
  //                         detailsCard(
  //                           count: data['cart_count'],
  //                           title: "in your cart",
  //                           width: context.screenWidth / 3.5,
  //                         ),
  //                         detailsCard(
  //                           count: data['wishlist_count'],
  //                           title: "in your wishlist",
  //                           width: context.screenWidth / 3.5,
  //                         ),
  //                         detailsCard(
  //                           count: data['order_count'],
  //                           title: "in your order",
  //                           width: context.screenWidth / 3.5,
  //                         ),
  //                       ],
  //                     ),
  //
  //                     // Profile Options (Buttons)
  //                     ListView.separated(
  //                       shrinkWrap: true, // Ensures it doesn't overflow
  //                       separatorBuilder: (context, index) {
  //                         return const Divider(color: lightGrey);
  //                       },
  //                       itemCount: profileButtonsList.length,
  //                       itemBuilder: (BuildContext context, int index) {
  //                         return ListTile(
  //                           leading: Image.asset(
  //                             profileButtonIcons[index],
  //                             width: 22,
  //                           ),
  //                           title: profileButtonsList[index]
  //                               .text
  //                               .fontFamily(semibold)
  //                               .color(darkFontGrey)
  //                               .make(),
  //                         );
  //                       },
  //                     )
  //                         .box
  //                         .white
  //                         .rounded
  //                         .margin(const EdgeInsets.all(12))
  //                         .padding(const EdgeInsets.symmetric(horizontal: 16))
  //                         .shadowMax
  //                         .make()
  //                         .box
  //                         .color(redColor)
  //                         .make(),
  //                   ],
  //                 ),
  //               );
  //             }
  //           },
  //         ),
  //       ),
  //     );
  //   }
  // }









  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:ecommerce/consts/consts.dart';
  import 'package:ecommerce/consts/iconList.dart';
  import 'package:ecommerce/controller/auth_controller.dart';
  import 'package:ecommerce/controller/profile_controller.dart';
  import 'package:ecommerce/pages/home_page/account_page/components/details_cards.dart';
  import 'package:ecommerce/pages/home_page/account_page/edit_profile_page.dart';
  import 'package:ecommerce/pages/login_page/login_page.dart';
  import 'package:ecommerce/services/firestore_services.dart';
  import 'package:ecommerce/widgets_common/bg_widgets.dart';
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';

  class AccountPage extends StatelessWidget {
    const AccountPage({super.key});

    @override
    Widget build(BuildContext context) {
      // Initialize both AuthController and ProfileController
      Get.put(AuthController());
      Get.put(ProfileController());

      // Check if currentUser is available before using it
      if (currentUser == null) {
        return Center(
          child: Text(
            "User is not logged in.",
            style: TextStyle(color: whiteColor),
          ),
        );
      }

      return bgWidgets(
        child: Scaffold(
          body: StreamBuilder(
            stream: FirestoreServices.getUser(currentUser!.uid),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Icon(Icons.error_outline);
              } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(
                  child: Text(
                    "No user data found.",
                    style: TextStyle(color: whiteColor),
                  ),
                );
              } else {
                var data = snapshot.data!.docs[0];

                return SafeArea(
                  child: Column(
                    children: [
                      // Edit Profile Section
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => EditProfilePage(data: data));
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Edit')
                                    .text
                                    .white
                                    .fontFamily(semibold)
                                    .make(),
                                const SizedBox(width: 10),
                                const Icon(Icons.edit, color: whiteColor),
                              ],
                            ),
                          ),
                        ),
                      ).box.margin(const EdgeInsets.only(right: 20, top: 10)).make(),

                      // Profile Section
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: [
                            data['imageUrl'] == ''
                                ? Image.asset(
                              imgProfile2,
                              width: 90,
                              fit: BoxFit.cover,
                            ).box.margin(const EdgeInsets.only(left: 8)).roundedFull.clip(Clip.antiAlias).make()
                                : Image.network(
                              data['imageUrl'],
                              width: 90,
                              fit: BoxFit.cover,
                            ).box.margin(const EdgeInsets.only(left: 8)).roundedFull.clip(Clip.antiAlias).make(),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  "${data['name']}".text.fontFamily(semibold).white.size(20).make(),
                                  "${data['email']}".text.size(12).white.make()
                                ],
                              ).box.margin(const EdgeInsets.only(left: 10)).make(),
                            ),
                            // Logout Button
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: redColor,
                                side: const BorderSide(color: whiteColor),
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero,
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // add padding
                                foregroundColor: whiteColor,
                              ),
                              onPressed: () async {
                                await Get.find<AuthController>().signoutMethod(context);
                                Get.offAll(() => const LoginPage());
                              },
                              child: "Logout".text.make(),
                            ).box.margin(const EdgeInsets.only(right: 10)).make(),
                          ],
                        ),
                      ),

                      // Details Cards (Cart, Wishlist, Orders)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(
                            count: data['cart_count'],
                            title: "in your cart",
                            width: context.screenWidth / 3.5,
                          ),
                          detailsCard(
                            count: data['wishlist_count'],
                            title: "in your wishlist",
                            width: context.screenWidth / 3.5,
                          ),
                          detailsCard(
                            count: data['order_count'],
                            title: "in your order",
                            width: context.screenWidth / 3.5,
                          ),
                        ],
                      ),

                      // Profile Options (Buttons)
                      ListView.separated(
                        shrinkWrap: true, // Ensures it doesn't overflow
                        separatorBuilder: (context, index) {
                          return const Divider(color: lightGrey);
                        },
                        itemCount: profileButtonsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset(
                              profileButtonIcons[index],
                              width: 22,
                            ),
                            title: profileButtonsList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          );
                        },
                      )
                          .box
                          .white
                          .rounded
                          .margin(const EdgeInsets.all(12))
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .shadowMax
                          .make()
                          .box
                          .color(redColor)
                          .make(),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      );
    }
  }
