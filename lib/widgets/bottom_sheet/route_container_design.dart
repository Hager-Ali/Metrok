import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/data/select_font_family.dart';

class RouteContainerDesign extends StatelessWidget {
  final Color containerBorderColor;
  final Color moreTextColor;
  final Color moreButtonBgColor;
  final Widget containerContent;
  final void Function()? moreButtonOnTap;

  const RouteContainerDesign({
    super.key,
    required this.containerContent,
    required this.containerBorderColor,
    required this.moreTextColor,
    required this.moreButtonBgColor,
    required this.moreButtonOnTap
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: containerBorderColor),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            containerContent,
            Row(
              children: [
                InkWell(
                  onTap: moreButtonOnTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    decoration: BoxDecoration(
                        color: moreButtonBgColor,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text('More'.tr,
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: SelectFontFamily.getFontFamily(),
                            color: moreTextColor)),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
