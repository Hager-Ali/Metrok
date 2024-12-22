import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';
import 'package:metrok/widgets/bottom_sheet/common_elements.dart';

Widget singleRoute(
    {required final String lineDirection,
    required final int stationsNum,
    required final String ticketPrice,
    required final String arrivalTime,
    }) {
  return Column(
    children: [
      Row(
        children: [
          const Icon(
            Icons.directions_outlined,
            size: 16,
            color: AppColors.grey,
          ),
          const SizedBox(width: 4),
          Text('Direction: '.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.grey)),
          const SizedBox(width: 4),
          Text(lineDirection.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.black))
        ],
      ),
      const SizedBox(height: 12),
      commonElements(
          stationsNum: stationsNum,
          ticketPrice: ticketPrice,
          arrivalTime: arrivalTime),
      const SizedBox(height: 12),
    ],
  );
}
