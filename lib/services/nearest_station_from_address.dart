// Libraries
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
// My packages
import 'package:metrok/data/stations_data.dart';
import 'package:metrok/models/lat_long_stations.dart';
import 'package:metrok/services/connectivity_service.dart';
import 'package:metrok/services/nearest_station_from_lat_log.dart';
import 'package:metrok/Utils/address_validator.dart';

class NearestStationFromAddress {
  final ConnectivityService _connectivityService = ConnectivityService();
  final NearestStation _nearestStation = NearestStation();

  Future<LatLongSations?> getStation(TextEditingController address) async {
    try { 
      // Format and validate address
      final addressText = AddressValidator.formatAddress(address.text);
      if (!AddressValidator.isValid(addressText)) {
        Get.snackbar('Error'.tr, 'Invalid address format'.tr);
        return null;
      }

      // Check internet connectivity
      final hasInternet = await _connectivityService.checkInternetConnection();
      if (!hasInternet) {
        Get.snackbar('Error'.tr, 'No internet connection'.tr);
        return null;
      }

      // Get location from address
      final locations = await locationFromAddress(addressText);
      if (locations.isEmpty) {
        Get.snackbar('Error'.tr, 'Address not found'.tr);
        return null;
      }

      // Get nearest station
      final location = locations.first;
      return _nearestStation.getNearestStation(
        location.latitude,
        location.longitude,
        StationsData.stations,
      );
    } catch (e) {
      Get.snackbar('Error'.tr, 'Failed to get nearest station'.tr);
      return null;
    }
  
  }
}
