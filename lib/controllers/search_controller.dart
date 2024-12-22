import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../services/address_processing.dart';
import '../services/nearest_station_from_address.dart';
import '../widgets/bottom_sheet/result_bottom_sheet.dart';

class SearchButtonController extends GetxController {
  final RxBool isLoading = false.obs;
  var source = '';
  var destination = '';

  Future<void> searchByStations(
    BuildContext context,
    String firstStationDropDown,
    String lastStationDropDown,
  ) async {
    if (!_validateStations(firstStationDropDown, lastStationDropDown)) return;

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
    if (!_validateAddresses(sourceAddress.text, destinationAddress.text)) {
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
      final secondStationResult =
          await nearestStationFromAddress.getStation(destinationAddress);

      if (secondStationResult == null) {
        isLoading.value = false;
        return;
      }

      source = firstStationResult;
      destination = secondStationResult.stationName;

      if (context.mounted) {
        ResultBottomSheet.showBottomSheet(context, source, destination);
      }
    } catch (e) {
      _handleError(e);
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateStations(String first, String last) {
    if (first.isEmpty || last.isEmpty) return false;

    if (first == last) {
      Get.snackbar('Error'.tr, 'Both stations are the same'.tr);
      return false;
    }
    return true;
  }

  bool _validateAddresses(String source, String destination) {
    if (destination.isEmpty) return false;

    if (source == destination) {
      Get.snackbar('Error'.tr, 'Source and destination are the same'.tr);
      return false;
    }

    return true;
  }

  void _handleError(dynamic error) {
    debugPrint(error.toString());
    Get.snackbar('Error'.tr, 'Something went wrong'.tr);
  }
}