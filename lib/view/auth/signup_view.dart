import 'package:ecommerce_app/core/view_model/auth_view_model.dart';
import 'package:ecommerce_app/view/widgets/custom_button.dart';
import 'package:ecommerce_app/view/widgets/custom_text.dart';
import 'package:ecommerce_app/view/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class SignUpView extends GetWidget<AuthViewModel> {
  SignUpView({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const CustomText(
                text: "Sign Up",
                fontSize: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: "Name",
                hintText: "Mahmoud",
                onSaved: (value) {
                  controller.name = value;
                },
                validator: (value) {},
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: "Email",
                hintText: "iamdavid@gmail.com",
                onSaved: (value) {
                  controller.emailAddress = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a email';
                  }
                  if (value.length < 6) {
                    return 'email@***.###';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                obscureText: true,
                text: "Password",
                hintText: "********",
                onSaved: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                onPressed: () {
                  formKey.currentState?.save();
                  if (formKey.currentState!.validate()) {
                    controller.creatAccountWithEmailAndPassword();
                  }
                },
                text: "SIGN UP",
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
