import 'package:flutter/material.dart';
import 'package:metrok/data/app_colors.dart';

Widget buildDragHandle() {
  return Center(
    child: Container(
      width: 42,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}