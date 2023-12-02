import 'package:ecommerce_app/view/auth/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen '),
      ),
      body: Center(
        child: MaterialButton(
            child: Text('logOut'),
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Get.offAll(LoginView());
            }),
      ),
    );
  }
}
