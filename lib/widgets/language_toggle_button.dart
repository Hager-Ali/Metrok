// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// My classes
import 'package:metrok/controllers/language_controller.dart';
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class LanguageToggleButton extends StatelessWidget {
  final LanguageController languageController;
  final convertToEnglish = 'Convert to English';
  final convertToArabic = 'التحويل إلى العربية';

  const LanguageToggleButton({super.key, required this.languageController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => languageController.toggleLanguage(),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.lightGrey),
                    borderRadius: BorderRadius.circular(8)),
                child: Obx(() {
                  String currentText = languageController.isArabic
                      ? convertToEnglish
                      : convertToArabic;

                  Image flagIcon = languageController.isArabic
                      ? Image.asset('assets/img/uk_flag.png',
                          width: 20, height: 20)
                      : Image.asset('assets/img/egypt_flag.png',
                          width: 20, height: 20);
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      flagIcon,
                      const SizedBox(width: 8),
                      Text(
                        currentText,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: SelectFontFamily.getFontFamily(),
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          )),
    );
  }
}
