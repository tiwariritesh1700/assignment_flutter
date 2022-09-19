import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_dimen.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  const AppButton({Key? key, this.onPressed, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          minimumSize: const Size.fromHeight(50)),
      child:  Text(buttonText,style: const TextStyle(fontSize: AppTextSize.BUTTON,color: AppColors.whiteColor,fontWeight: FontWeight.w400,letterSpacing: 0.75),),
    );
  }
}
