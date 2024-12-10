// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/controllers/search_controller.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onPressedSearchButton;

  const SearchButton({super.key, required this.onPressedSearchButton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedSearchButton,
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(Size(Get.width, 50)),
        backgroundColor: WidgetStateProperty.all(AppColors.blue),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      child: Text(
        'Search'.tr,
        style: TextStyle(
          fontSize: 16,
          fontFamily: SelectFontFamily.getFontFamily(),
          ),
      ),
    );
  }
}

// class SearchButton extends StatelessWidget {
//   final bool isStationActive;
//   final String firstStationDropDown;
//   final String lastStationDropDown;
//   final TextEditingController address1;
//   final TextEditingController address2;

//   SearchButton({
//     super.key,
//     required this.isStationActive,
//     required this.firstStationDropDown,
//     required this.lastStationDropDown,
//     required this.address1,
//     required this.address2,
//   });

//   final SearchButtonController searchController = Get.put(SearchButtonController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => ElevatedButton(
//       onPressed: searchController.isLoading.value
//           ? null
//           : () async {
//               if (isStationActive) {
//                 await searchController.searchByStations(
//                   context,
//                   firstStationDropDown,
//                   lastStationDropDown,
//                 );
//               } else {
//                 await searchController.searchByAddresses(
//                   context,
//                   address1,
//                   address2,
//                 );
//               }
//             },
//       style: ElevatedButton.styleFrom(
//         minimumSize: const Size(double.infinity, 50),
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//       ),
//       child: searchController.isLoading.value
//           ? const CircularProgressIndicator(color: Colors.white)
//           : Text('Search'.tr),
//     ));
//   }
// }
