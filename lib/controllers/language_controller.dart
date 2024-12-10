// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController {
  
  final file = GetStorage();
  var selectedLanguage = 'en'.obs; 

   LanguageController() {
    selectedLanguage.value = file.read('selectedLanguage') ?? 'en';
  }
  bool get isArabic => selectedLanguage.value == 'ar'; // if selectedLanguage.value == 'ar' so isArabic = true

  void toggleLanguage() {
    if (isArabic) {
      selectedLanguage.value = 'en';
      Get.updateLocale(const Locale('en'));
      file.write('selectedLanguage', 'en');
    } else {
      selectedLanguage.value = 'ar';
      Get.updateLocale(const Locale('ar'));
      file.write('selectedLanguage', 'ar');
    }
  }
}