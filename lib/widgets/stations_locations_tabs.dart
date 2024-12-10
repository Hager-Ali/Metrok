// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class StationLocationTabs extends StatelessWidget {

  final RxBool stationActive;
  final RxBool locationActive;
  final VoidCallback onStationTap;
  final VoidCallback onLocationTap;
  
  const StationLocationTabs({
    super.key,
    required this.stationActive,
    required this.locationActive,
    required this.onStationTap,
    required this.onLocationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.87,
      height: 58,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTab(
            icon: Icons.train,
            label: 'Stations'.tr,
            isActive: stationActive,
            onTap: onStationTap,
          ),
          _buildTab(
            icon: Icons.location_on,
            label: 'Locations'.tr,
            isActive: locationActive,
            onTap: onLocationTap,
          ),
        ],
      ),
    );
  }

  Widget _buildTab({
    required IconData icon,
    required String label,
    required RxBool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Obx(() => Icon(icon,
                  size: 22,
                  color: isActive.value ? AppColors.blue : AppColors.black)),
              const SizedBox(width: 6),
              Obx(() => Text(
                    label,
                    style: TextStyle(
                      color: isActive.value ? AppColors.blue : AppColors.black,
                      fontFamily: SelectFontFamily.getFontFamily(),
                      fontWeight: FontWeight.w400,
                      fontSize: 15
                    ),
                  )),
            ],
          ),
          const SizedBox(height: 5),
          Obx(() => Container(
                width: 100,
                height: 2,
                color: isActive.value ? Colors.blue : Colors.transparent,
              )),
        ],
      ),
    );
  }
}