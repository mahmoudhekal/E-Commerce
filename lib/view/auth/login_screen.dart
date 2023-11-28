import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../constance.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_social_button.dart';
import '../widgets/custom_textFormField.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                CustomText(
                  text: "Welcome,",
                  fontSize: 30,
                ),
                CustomText(
                  text: "Sign Up",
                  color: AppColor.primaryColor,
                  fontSize: 18,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
              text: "Sign in to Continue",
              fontSize: 14,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              text: "Email",
              hintText: "iamdavid@gmail.com",
              onSaved: (value) {},
              validator: (value) {},
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              text: "Password",
              hintText: "********",
              onSaved: (value) {},
              validator: (value) {},
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "Forgot Password?",
              fontSize: 14,
              alignment: Alignment.topRight,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {},
              text: "SIGN IN",
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomText(
              text: "-OR-",
              alignment: Alignment.center,
              fontSize: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomSocialButton(
              onPressed: () {
                controller.googleSignInMethod();
              },
              text: "Sign In with Google",
              imageName: 'assets/images/google.png',
            ),
            const SizedBox(
              height: 020,
            ),
            CustomSocialButton(
              onPressed: () {},
              text: "Sign In with Facebook",
              imageName: 'assets/images/facebook.png',
            ),
          ],
        ),
      ),
    );
  }
}
