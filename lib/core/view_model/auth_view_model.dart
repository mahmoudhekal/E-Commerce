import 'package:ecommerce_app/view/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth auth = FirebaseAuth.instance;
  late String emailAddress, password, name;
  Rxn<User> _firebaseUser = Rxn<User>();
  String? get user => _firebaseUser.value?.uid;

  @override
  void onInit() {
    // _firebaseUser?.bindStream(auth.authStateChanges());
    super.onInit();
    _firebaseUser.bindStream(auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _firebaseUser.value = auth.currentUser;
    _firebaseUser.bindStream(auth.userChanges());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void signInWithEmailAndPassword() async {
    try {
      // ignore: unused_local_variable
      await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      Get.to(const HomeView());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        e.code == 'user-not-found'
            ? "No user found for that email."
            : e.code == 'wrong-password'
                ? 'Wrong password provided for that user.'
                : "Error happened please try again",
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void creatAccountWithEmailAndPassword() async {
    try {
      // ignore: unused_local_variable
      await auth.createUserWithEmailAndPassword(
          email: emailAddress, password: password);
      Get.to(const HomeView());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        e.code == 'user-not-found'
            ? "No user found for that email."
            : e.code == 'wrong-password'
                ? 'Wrong password provided for that user.'
                : "Error happened please try again",
        e.message.toString(),
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<UserCredential> googleSignInMethod() async {
    final googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return auth.signInWithCredential(facebookAuthCredential);
  }
}
