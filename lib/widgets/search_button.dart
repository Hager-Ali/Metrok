// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onPressedSearchButton;
  final bool isLoading;

  const SearchButton({
    super.key,
    required this.onPressedSearchButton,
    this.isLoading = false, // initial value
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressedSearchButton,
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(Size(Get.width, 50)),
        backgroundColor: WidgetStateProperty.all(AppColors.blue),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              ),
            )
          : Text(
              'Search'.tr,
              style: TextStyle(
                fontSize: 16,
                fontFamily: SelectFontFamily.getFontFamily(),
              ),
            ),
    );
  }
}
