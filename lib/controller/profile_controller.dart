 // import 'package:ecommerce/consts/consts.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ProfileController extends GetxController{
// var profileImgPath = ''.obs;
//
//   var nameController = TextEditingController();
//   var passController = TextEditingController();
//
// changeImage(context) async{
//   try {
//     final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
//     if(img==null) return;
//     profileImgPath.value = img.path;
//   } on PlatformException catch (e) {
//     VxToast.show(context, msg: e.toString());
//   }
// }
// }


//
// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/consts/consts.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class ProfileController extends GetxController {
//   var profileImgPath = ''.obs;
//
//   var profileImgLink = '';
//
//   var isloading = false.obs;
//
//   var nameController = TextEditingController();
//   var passController = TextEditingController();
//
//   changeImage(context) async {
//     try {
//       final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
//       if (img == null) return;
//       profileImgPath.value = img.path;
//     } on PlatformException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//   }
//
//
//   uploadProfileImage() async{
//     var filename = basename(profileImgPath.value);
//     var destination = 'image/${currentUser!.uid}/$filename';
//     Reference ref = FirebaseStorage.instance.ref().child(destination);
//     await ref.putFile(File(profileImgPath.value));
//     profileImgLink = await ref.getDownloadURL();
//   }
//
//   profileUpdate ({name,password,imageUrl}) async{
//     var store = firestore.collection(userCollection).doc(currentUser!.uid);
//     await  store.set({
//       'name' : name,
//       'password' : password,
//       'imageUrl' : imgUrl,
//     },SetOptions(merge: true));
//     isloading(false);
//   }
// }



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;

  var profileImgLink = '';


  var isloading = false.obs;

  var nameController = TextEditingController();
  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();

  changeImage(context) async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async {
      // var filename = basename(profileImgPath.value);
    var filename = path.basename(profileImgPath.value);
      var destination = 'image/${currentUser!.uid}/$filename';
      Reference ref = FirebaseStorage.instance.ref().child(destination);
      await ref.putFile(File(profileImgPath.value));
      profileImgLink = await ref.getDownloadURL();
  }

  profileUpdate({name, password, imageUrl}) async {
    isloading(true);
    await uploadProfileImage();
    var store = firestore.collection(userCollection).doc(currentUser!.uid);
    await store.set({
      'name': name,
      'password': password,
      'imageUrl': imageUrl,
    }, SetOptions(merge: true));
    isloading(false);
  }

  changeAuthPassword({email,password,newpassword})async{
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value){
      currentUser!.updatePassword(newpassword);
    }).catchError((error) {
      print(error.toString());
    });
  }

}