import 'package:get/get.dart';

class TimeCalculator {
  static String calcArrivalTime(int stationsNum) {
    final int totalMinutes = (stationsNum * 3);
    final int hours = totalMinutes ~/ 60;
    final int minutes = totalMinutes % 60;

    if (hours > 0) {
      return minutes > 0
          ? '$hours ${'hour'.tr} $minutes ${'minute'.tr}'
          : '$hours ${'hour'.tr}';
    } else {
      return '$minutes ${'minute'.tr}';
    }
  }
}
// ~/ لو كان الناتج من القسمة يحتوي على جزء عشري، يتم تجاهل الجزء العشري
// % باقي القسمه