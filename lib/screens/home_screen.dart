// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/services/address_processing.dart';
import 'package:metrok/services/nearest_station_from_address.dart';
import 'dart:async';
// My classes
import 'package:metrok/services/nearest_station_from_lat_log.dart';
import 'package:metrok/widgets/bottom_sheet/result_bottom_sheet.dart';
import 'package:metrok/widgets/search_button.dart';
import 'package:metrok/widgets/stations_locations_tabs.dart';
import 'package:metrok/widgets/welcome_text.dart';
import 'package:metrok/widgets/stations_dropdown.dart';
import 'package:metrok/controllers/language_controller.dart';
import 'package:metrok/widgets/address_fields.dart';
import 'package:metrok/services/location_service_manager.dart';
import 'package:metrok/widgets/language_toggle_button.dart';
import 'package:metrok/widgets/nearest_station_row.dart';
import 'package:metrok/services/my_current_location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? nearestStation;
  double? latNearestStation;
  double? longNearestStation;

  final RxBool stationActive = true.obs;
  final RxBool locationActive = false.obs;

  var firstStationDropDown = '';
  var lastStationDropDown = '';

  final address1 = TextEditingController();
  final address2 = TextEditingController();

  final locationServiceManager = LocationServiceManager();
  late final LanguageController languageController;

  final MyCurrentLocation myCurrentLocation = MyCurrentLocation();

  @override
  void initState() {
    super.initState();
    _getNearestStation();
    _initializeLocationService();

    languageController = Get.put(
        LanguageController()); // Get.put: This makes it possible to access this object anywhere in the application.
  }

  @override
  void dispose() {
    locationServiceManager.stopLocationServiceListener();
    super.dispose();
  }

  // If the user locked the location service while using the application
  void _initializeLocationService() {
    locationServiceManager.startLocationServiceListener(
      () {
        _getNearestStation();
      },
      () {
        Get.snackbar('Error', 'Location service is disabled.');
      },
    );
  }

  // Get nearest station from NearestStation Class
  Future<void> _getNearestStation() async {
    final nearestStationObj = NearestStation();

    final latLongNearestStation = await nearestStationObj.findNearestStation();

    if (latLongNearestStation == null) {
      return;
    }

    final stationName = latLongNearestStation.stationName;
    final latStation = latLongNearestStation.lat;
    final longStation = latLongNearestStation.long;

    setState(() {
      nearestStation = stationName;
      latNearestStation = latStation;
      longNearestStation = longStation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 22, top: 20, right: 22),
        child: Column(
          children: [
            const WelcomeText(),
            const SizedBox(height: 8),
            NearestStationRow(
                nearestStation: nearestStation,
                latNearestStation: latNearestStation,
                longNearestStation: longNearestStation),
            const SizedBox(height: 24),
            StationLocationTabs(
              stationActive: stationActive,
              locationActive: locationActive,
              onStationTap: () {
                stationActive.value = true;
                locationActive.value = false;
              },
              onLocationTap: () {
                stationActive.value = false;
                locationActive.value = true;
              },
            ),
            const SizedBox(height: 20),
            Obx(
              () => stationActive.value
                  ? _buildStationSelectionView()
                  : _buildAddressInputView()),
            const SizedBox(height: 24),
            // SearchButton(
            //   isStationActive: stationActive.value,
            //   firstStationDropDown: firstStationDropDown,
            //   lastStationDropDown: lastStationDropDown,
            //   address1: address1,
            //   address2: address2),
            SearchButton(onPressedSearchButton: () async {
              if (stationActive.value) {
                if (firstStationDropDown.isNotEmpty &&
                    lastStationDropDown.isNotEmpty) {
                  if (firstStationDropDown != lastStationDropDown) {
                    ResultBottomSheet.showBottomSheet(
                        context, firstStationDropDown, lastStationDropDown);
                  } else {
                    Get.snackbar('Error'.tr, 'Both stations are the same'.tr);
                  }
                }
              } else {
                if (address2.text.isNotEmpty) {
                  if (address1.text != address2.text) {
                    final result = await processAddresses(address1);
                    if (result == null) {
                      return;
                    }
                    final nearestStationFromAddress =
                        NearestStationFromAddress();
                    final latLongNearestStation2 =
                        await nearestStationFromAddress.getStation(address2);
                    if (latLongNearestStation2 == null) {
                      return;
                    }
                    firstStationDropDown = result;
                    lastStationDropDown = latLongNearestStation2.stationName;

                    ResultBottomSheet.showBottomSheet(
                      context,
                      firstStationDropDown,
                      lastStationDropDown,
                    );
                  }
                }
              }
            }
            ),
            const SizedBox(height: 6),
            LanguageToggleButton(languageController: languageController),
          ],
        ),
      )),
    );
  }
  Widget _buildStationSelectionView() {
    return Column(
      children: [
        StationsDropdown(
          hintText: 'Select first station',
          onSelectionChange: (selectedItem) {
            firstStationDropDown = selectedItem.isNotEmpty ? selectedItem.first : '';
          },
        ),
        const SizedBox(height: 20),
        StationsDropdown(
          hintText: 'Select last station',
          onSelectionChange: (selectedItem) {
            lastStationDropDown = selectedItem.isNotEmpty ? selectedItem.first : '';
          },
        ),
      ],
    );
  }

  Widget _buildAddressInputView() {
    return Column(
      children: [
        AddressFields(
          address: address1,
          hintText: 'Your current location',
        ),
        const SizedBox(height: 20),
        AddressFields(
          address: address2,
          hintText: 'Write destination',
        ),
      ],
    );
  }
}