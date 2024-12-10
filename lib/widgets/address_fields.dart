// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class AddressFields extends StatelessWidget {
  final TextEditingController address;
  final String hintText;

  const AddressFields({
    super.key,
    required this.address,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    RxBool showClearIcon = false.obs;
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
        border: Border.all(
          color: AppColors.lightGrey,
        ),
      ),
      child: Obx(
        () => TextField(
        controller: address,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            hintText: hintText.tr,
            hintStyle: TextStyle(
              color: hintText == 'Your current location' || hintText == 'موقعك الحالي' ? AppColors.blue : AppColors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: showClearIcon.value
              ? IconButton(
                  onPressed: () {
                    address.clear();
                      showClearIcon.value = false;
                  },
                  icon: const Icon(Icons.clear, size: 20),
                )
              : const SizedBox(),
            ),
            style: TextStyle(
            fontSize: 16,
            fontFamily: SelectFontFamily.getFontFamily(),
            fontWeight: FontWeight.w300,
            ),
            onChanged: (text) {
            showClearIcon.value = text.isNotEmpty;
        },
      ),
      )
    );
  }
}
