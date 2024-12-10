import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class FirstAndLastStationsRow extends StatelessWidget {
  final String firstStationDropDown;
  final String lastStationDropDown;

  const FirstAndLastStationsRow({
    super.key,
    required this.firstStationDropDown,
    required this.lastStationDropDown,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildStationColumn(IconData icon, String text) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.blue,
          ),
          const SizedBox(height: 4),
          Text(
            text.tr.replaceAll(' ', '\n'),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: SelectFontFamily.getFontFamily(),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildStationColumn(
            Icons.mode_standby_outlined, firstStationDropDown.tr),
        const SizedBox(width: 18),
        const Icon(Icons.more_horiz, size: 14, color: AppColors.grey),
        const SizedBox(width: 18),
        buildStationColumn(Icons.location_on_outlined, lastStationDropDown.tr),
      ],
    );
  }
}