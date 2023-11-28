import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomSocialButton extends StatelessWidget {
  final String? text;
  final String? imageName;

  final Color? color;
  final VoidCallback onPressed;
  CustomSocialButton(
      {super.key,
      required this.onPressed,
      this.text,
      this.color,
      this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey.shade100),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(imageName!),
            const SizedBox(
              width: 40,
            ),
            CustomText(
              text: text!,
              fontSize: 14,
            )
          ],
        ),
      ),
    );
  }
}
