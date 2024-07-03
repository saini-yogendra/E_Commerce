import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  Future<UserCredential?> loginMethod({email,password,context})async{
    UserCredential? userCredential;
    try{
  await auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }


  Future<UserCredential?> signMethod({email,password,context})async{
    UserCredential? userCredential;
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }


  storeUserData({name,password,email}) async{
    DocumentReference store = await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name' :name,
      'password':password,
      'email':email,
      'imageUrl':''
    });

    signoutMethod(context) async{
      try{
        await auth.signOut();
      } catch(e){
        VxToast.show(context, msg: e.toString());
      }
    }
  }

}