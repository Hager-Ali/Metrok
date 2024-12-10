import 'package:flutter/material.dart';
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class MoreDetailsBottomSheet extends StatelessWidget {
  final String lineDirection;
  final int stationsNum;
  final String ticketPrice;
  final String arrivalTime;

  const MoreDetailsBottomSheet({
    super.key,
    required this.lineDirection,
    required this.stationsNum,
    required this.ticketPrice,
    required this.arrivalTime,
  });

  static void show(
    BuildContext context, {
    required String lineDirection,
    required int stationsNum,
    required String ticketPrice,
    required String arrivalTime,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => MoreDetailsBottomSheet(
        lineDirection: lineDirection,
        stationsNum: stationsNum,
        ticketPrice: ticketPrice,
        arrivalTime: arrivalTime,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      minChildSize: 0.14,
      maxChildSize: 0.95,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(20)),
                  width: 42,
                  height: 4,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'Additional Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: SelectFontFamily.getFontFamily(),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // عرض البيانات المستلمة
              Text(
                'Line Direction: $lineDirection',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Number of Stations: $stationsNum',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Ticket Price: $ticketPrice',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Arrival Time: $arrivalTime',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
