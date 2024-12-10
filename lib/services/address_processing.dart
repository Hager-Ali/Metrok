import 'package:flutter/material.dart';
import 'package:metrok/services/nearest_station_from_address.dart';
import 'package:metrok/services/nearest_station_from_lat_log.dart';

Future<String?> processAddresses(TextEditingController address1) async {
  final nearestStationObject = NearestStation();
  final nearestStationFromAddress = NearestStationFromAddress();

  String stationName = '';

  // Check address1
  if (address1.text.isEmpty) {
    // Use current location
    final currentStation = await nearestStationObject.findNearestStation();
    if (currentStation == null) {
      return null;
    } else {
      stationName = currentStation.stationName;
    }
  } else {
    // Use the entered location
    final station = await nearestStationFromAddress.getStation(address1);
    if (station == null) {
      return null;
    } else {
      stationName = station.stationName;
    }
  }
  return stationName;
}
