import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

Widget commonElements({
  required final String stationsNum,
  required final String ticketPrice,
  required final String arrivalTime,
}) {
  return Column(
    children: [
      Row(
        children: [
          const Icon(Icons.tag, size: 16, color: AppColors.grey),
          const SizedBox(width: 4),
          Text('Number of stations: '.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.grey)),
          const SizedBox(width: 4),
          Text(stationsNum,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.black)),
        ],
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          const Icon(Icons.attach_money, size: 16, color: AppColors.grey),
          const SizedBox(width: 4),
          Text('Ticket price: '.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.grey)),
          const SizedBox(width: 4),
          Text(ticketPrice.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.black)),
        ],
      ),
      const SizedBox(height: 12),
      Row(
        children: [
          const Icon(Icons.access_time, size: 16, color: AppColors.grey),
          const SizedBox(width: 4),
          Text('Arrival time: '.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.grey)),
          const SizedBox(width: 4),
          Text(arrivalTime.tr,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.black)),
        ],
      )
    ],
  );
}