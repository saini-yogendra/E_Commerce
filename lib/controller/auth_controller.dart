// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce/consts/consts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class AuthController extends GetxController {
//
//   var isLoading =false.obs;
//
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();
//
//   Future<UserCredential?> loginMethod({context}) async {
//     UserCredential? userCredential;
//     try {
//       userCredential = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }
//
//   Future<UserCredential?> signupMethod({email, password, context}) async {
//     UserCredential? userCredential;
//     try {
//       userCredential = await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       print("///////////////////////////////////////////////////////////");
//       print(userCredential);
//     } on FirebaseAuthException catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//     return userCredential;
//   }
//
//   // storeUserData({name, password, email}) async {
//   //   DocumentReference store =
//   //       firestore.collection(userCollection).doc(currentUser!.uid);
//   //   store.set(
//   //       {'name': name, 'password': password, 'email': email, 'imageUrl': ''});
//   // }
//
//   storeUserData({required String name, required String password, required String email}) async {
//     print('Storing user data...');
//     print('Name: $name');
//     print('Password: $password');
//     print('Email: $email');
//
//     DocumentReference store =
//     firestore.collection(userCollection).doc(currentUser!.uid);
//     print('Document reference: ${store.path}');
//
//     await store.set({
//       'name': name,
//       'password': password,
//       'email': email,
//       'imageUrl': '',
//       'id': currentUser!.uid,
//       'cart_count' : "00",
//       'wishlist_count' : "00",
//       'order_count' : "00",
//     });
//
//     print('User data stored successfully!');
//   }
//
//   signoutMethod(context) async {
//     try {
//       await auth.signOut();
//     } catch (e) {
//       VxToast.show(context, msg: e.toString());
//     }
//   }
// }










import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Login Method
  Future<UserCredential?> loginMethod({required BuildContext context}) async {
    UserCredential? userCredential;

    try {
      isLoading(true);
      userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      isLoading(false);
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      VxToast.show(context, msg: e.message ?? "Login failed, please try again.");
    } catch (e) {
      isLoading(false);
      VxToast.show(context, msg: "Something went wrong. Please try again.");
    }

    return userCredential;
  }

  // Signup Method
  Future<UserCredential?> signupMethod({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    UserCredential? userCredential;

    try {
      isLoading(true);
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      isLoading(false);
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      VxToast.show(context, msg: e.message ?? "Signup failed, please try again.");
    } catch (e) {
      isLoading(false);
      VxToast.show(context, msg: "An error occurred during signup.");
    }

    return userCredential;
  }

  // Store User Data in Firestore
  Future<void> storeUserData({
    required String name,
    required String password,
    required String email,
  }) async {
    if (currentUser == null) {
      print('Error: No user is currently signed in.');
      return;
    }

    DocumentReference store = firestore.collection(userCollection).doc(currentUser!.uid);

    await store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
      'cart_count': "00",
      'wishlist_count': "00",
      'order_count': "00",
    }).then((_) {
      print('User data stored successfully in Firestore!');
    }).catchError((error) {
      print('Failed to store user data: $error');
    });
  }

  // Signout Method
  Future<void> signoutMethod(BuildContext context) async {
    try {
      await auth.signOut();
      VxToast.show(context, msg: "Successfully signed out.");
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
