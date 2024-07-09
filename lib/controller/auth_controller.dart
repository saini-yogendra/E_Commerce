import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("///////////////////////////////////////////////////////////");
      print(userCredential);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storeUserData({name, password, email}) async {
  //   DocumentReference store =
  //       firestore.collection(userCollection).doc(currentUser!.uid);
  //   store.set(
  //       {'name': name, 'password': password, 'email': email, 'imageUrl': ''});
  // }

  storeUserData({required String name, required String password, required String email}) async {
    print('Storing user data...');
    print('Name: $name');
    print('Password: $password');
    print('Email: $email');

    DocumentReference store =
    firestore.collection(userCollection).doc(currentUser!.uid);
    print('Document reference: ${store.path}');

    await store.set({
      'name': name,
      'password': password,
      'email': email,
      'imageUrl': ''
    });

    print('User data stored successfully!');
  }

  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
