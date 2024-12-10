// import 'package:flutter/material.dart';
// import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
// import 'package:get/get.dart';
// import 'package:metrok/data/app_colors.dart';
// import 'package:metrok/data/select_font_family.dart';
// import 'package:metrok/services/ways_details.dart';

// class StationsExpansionTile extends StatefulWidget {

//   final RxString firstStationDropDown;
//   final RxString lastStationDropDown;

//   StationsExpansionTile({
//     super.key,
//     required this.firstStationDropDown,
//     required this.lastStationDropDown,
//   });

//   final isExpanded = false.obs;
//   final waysDetails = WaysDetails();

//   @override
//   State<StationsExpansionTile> createState() => _ServicesState();
// }

// class _ServicesState extends State<StationsExpansionTile> {
//   late ExpandedTileController _controller;

  

//   @override
//   void initState() {
//     _controller = ExpandedTileController(isExpanded: false);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//   final waysDetails = WaysDetails();
//   waysDetails.getWays(firstStationDropDown.value, lastStationDropDown.value);
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 15),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: AppColors.white,
//         border: Border.all(
//           color: AppColors.grey.withOpacity(0.5),
//           width: 1.0, // عرض البوردر
//         ),
//       ),
//       child: ExpandedTile(
//         theme: const ExpandedTileThemeData(
//           contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//           contentBackgroundColor: AppColors.white,
//         ),
//         title: Text(
//           'Stations names'.tr,
//           style: TextStyle(
//               fontSize: 14,
//               fontFamily: SelectFontFamily.getFontFamily(),
//               color: AppColors.grey),
//         ),
//         leading: Icon(Icons.train, size: 16, color: AppColors.grey),
//         controller: _controller,
//         content: Obx(() => Expanded(
//                               child: RichText(
//                                 maxLines: 10,
//                                 text: TextSpan(
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     fontFamily:
//                                         SelectFontFamily.getFontFamily(),
//                                     color: AppColors.black,
//                                   ),
//                                   children:
//                                       waysDetails.stationsNames.map((station) {
//                                     return TextSpan(
//                                       text:
//                                           '${station.tr}, ', // إضافة فاصلة بعد كل محطة
//                                       style: TextStyle(
//                                         color: AppColors.black,
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),
//                               ),
//                             )
//       ),
//     ));
//   }
// }
