// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class FirstTitleInBottomSheet extends StatelessWidget {
  final bool singleContainer;
  const FirstTitleInBottomSheet({
    super.key,
    required this.singleContainer
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 10),
        Icon(
          Icons.circle,
          size: 14,
          color: AppColors.blue,
        ),
        SizedBox(width: 8),
         Text(
          singleContainer ? 'The only route'.tr : 'Shortest route'.tr,
          style: TextStyle(
            fontSize: 14,
            fontFamily: SelectFontFamily.getFontFamily(),
            color: AppColors.blue,
          ),
        ),
      ],
    );
  }
}
