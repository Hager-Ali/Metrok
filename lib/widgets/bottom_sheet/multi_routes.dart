import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';
import 'package:metrok/widgets/bottom_sheet/common_elements.dart';

Widget multiRoutes({
  required final String exchangeStation,
  required final String firstDirection,
  required final String secondDirection,
  required final String stationsNum,
  required final String ticketPrice,
  required final String arrivalTime,
}) {
  return Column(children: [
    Row(
      children: [
        const Icon(
          Icons.swap_horiz,
          size: 16,
          color: AppColors.grey,
        ),
        const SizedBox(width: 4),
        Text('Exchange station: '.tr,
            style: TextStyle(
                fontSize: 14,
                fontFamily: SelectFontFamily.getFontFamily(),
                color: AppColors.grey)),
        const SizedBox(width: 4),
        Text(exchangeStation.tr,
            style: TextStyle(
                fontSize: 14,
                fontFamily: SelectFontFamily.getFontFamily(),
                color: AppColors.black))
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: [
        const Icon(
          Icons.directions_outlined,
          size: 16,
          color: AppColors.grey,
        ),
        const SizedBox(width: 4),
        Text('First direction: '.tr,
            style: TextStyle(
                fontSize: 14,
                fontFamily: SelectFontFamily.getFontFamily(),
                color: AppColors.grey)),
        const SizedBox(width: 4),
        Text(firstDirection.tr,
            style: TextStyle(
                fontSize: 14,
                fontFamily: SelectFontFamily.getFontFamily(),
                color: AppColors.black))
      ],
    ),
    const SizedBox(height: 12),
    Row(
      children: [
        const Icon(
          Icons.directions_outlined,
          size: 16,
          color: AppColors.grey,
        ),
        const SizedBox(width: 4),
        Text('Second direction: '.tr,
            style: TextStyle(
                fontSize: 14,
                fontFamily: SelectFontFamily.getFontFamily(),
                color: AppColors.grey)),
        const SizedBox(width: 4),
        Text(secondDirection.tr,
            style: TextStyle(
                fontSize: 14,
                fontFamily: SelectFontFamily.getFontFamily(),
                color: AppColors.black)),
        const SizedBox(height: 12),
      ],
    ),
    const SizedBox(height: 12),
    commonElements(
        stationsNum: stationsNum,
        ticketPrice: ticketPrice,
        arrivalTime: arrivalTime),
    const SizedBox(height: 12),
  ]);
}