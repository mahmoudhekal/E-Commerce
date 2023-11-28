import 'package:flutter/material.dart';

import '../../constance.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
   CustomButton({super.key,this.text="",this.color=Colors.black,required this.onPressed});
    

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(18),
      color: AppColor.primaryColor,
      child: CustomText(
        text: text,
        color: color,
        alignment: Alignment.center,
      ),
    );
  }
}
