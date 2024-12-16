import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/address_processing.dart';
import '../services/nearest_station_from_address.dart';
import '../widgets/bottom_sheet/result_bottom_sheet.dart';

class SearchButtonController extends GetxController {
  final RxBool isLoading = false.obs;
  var firstStation = '';
  var lastStation = '';

  Future<void> searchByStations(
    BuildContext context,
    String firstStationDropDown,
    String lastStationDropDown,
  ) async {
    if (firstStationDropDown.isEmpty || lastStationDropDown.isEmpty) {
      Get.snackbar('Error'.tr, 'Please select both stations'.tr);
      return;
    }

    if (firstStationDropDown == lastStationDropDown) {
      Get.snackbar('Error'.tr, 'Both stations are the same'.tr);
      return;
    }

    ResultBottomSheet.showBottomSheet(
      context,
      firstStationDropDown,
      lastStationDropDown,
    );
  }

  Future<void> searchByAddresses(
    BuildContext context,
    TextEditingController sourceAddress,
    TextEditingController destinationAddress,
  ) async {
    if (destinationAddress.text.isEmpty) {
      Get.snackbar('Error'.tr, 'Please enter destination address'.tr);
      return;
    }

    if (sourceAddress.text == destinationAddress.text) {
      Get.snackbar('Error'.tr, 'Source and destination are the same'.tr);
      return;
    }

    isLoading.value = true;
    try {
      final firstStationResult = await processAddresses(sourceAddress);
      if (firstStationResult == null) {
        isLoading.value = false;
        return;
      }

      final nearestStationFromAddress = NearestStationFromAddress();
      final secondStationResult = await nearestStationFromAddress.getStation(destinationAddress);
      
      if (secondStationResult == null) {
        isLoading.value = false;
        return;
      }

      firstStation = firstStationResult;
      lastStation = secondStationResult.stationName;

      ResultBottomSheet.showBottomSheet(
        context,
        firstStation,
        lastStation,
      );
    } finally {
      isLoading.value = false;
    }
  }
}