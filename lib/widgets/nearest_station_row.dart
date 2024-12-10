// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class NearestStationRow extends StatelessWidget {
  final String? nearestStation;
  final double? latNearestStation;
  final double? longNearestStation;

  const NearestStationRow({
    super.key,
    required this.nearestStation,
    required this.latNearestStation,
    required this.longNearestStation,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, size: 18, color: AppColors.grey),
        const SizedBox(width: 4),
        Text(
          'Nearest station: '.tr,
          style: _getTextStyle(color: AppColors.grey),
        ),
        nearestStation == null
            ? Text(
                'Loading ...'.tr,
                style: _getTextStyle(color: AppColors.blue),
              )
            : Row(
                children: [
                  InkWell(
                    onTap: () => _launchMap(latNearestStation,longNearestStation),
                    child: Text(
                      '$nearestStation'.tr,
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 14,
                        fontFamily: SelectFontFamily.getFontFamily(),
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Icon(
                    Icons.launch,
                    color: AppColors.blue,
                    size: 18,
                    semanticLabel: 'Open in map',
                  )
                ],
              )
      ],
    );
  }

  TextStyle _getTextStyle({required Color color}) {
    return TextStyle(
      color: color,
      fontSize: 14,
      fontFamily: SelectFontFamily.getFontFamily(),
      fontWeight: FontWeight.w400,
    );
  }

  Future<void> _launchMap(double? latNearestStation, double? longNearestStation) async {
    final uri = Uri.parse('geo:0,0?q=$latNearestStation,$longNearestStation');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar('Error', 'Could not launch map.');
    }
  }
}
