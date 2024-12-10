// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Welcome to Metrok'.tr,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 18,
            fontFamily: SelectFontFamily.getFontFamily(),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
