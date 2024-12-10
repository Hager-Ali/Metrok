// Packages
import 'package:get/get.dart';

class SelectFontFamily {
  static String getFontFamily() {
    return Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Poppins';
  }
}