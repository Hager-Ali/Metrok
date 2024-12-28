// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';
import 'dart:async';
// Services
import 'package:metrok/services/nearest_station_from_lat_log.dart';
import 'package:metrok/services/location_service_manager.dart';
import 'package:metrok/services/my_current_location.dart';
import 'package:metrok/widgets/bottom_sheet/first_and_last_stations_row.dart';
import 'package:metrok/widgets/bottom_sheet/result_bottom_sheet.dart';
// Widgets
import 'package:metrok/widgets/search_button.dart';
import 'package:metrok/widgets/stations_locations_tabs.dart';
import 'package:metrok/widgets/welcome_text.dart';
import 'package:metrok/widgets/stations_dropdown.dart';
import 'package:metrok/widgets/address_fields.dart';
import 'package:metrok/widgets/language_toggle_button.dart';
import 'package:metrok/widgets/nearest_station_row.dart';
// Controllers
import 'package:metrok/controllers/language_controller.dart';
import 'package:metrok/controllers/search_controller.dart';
// Models
import 'package:metrok/models/search_history.dart';

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

  var firstStationDropDown = ''.obs;
  var lastStationDropDown = ''.obs;

  final sourceAddress = TextEditingController();
  final destinationAddress = TextEditingController();

  final locationServiceManager = LocationServiceManager();
  late final LanguageController languageController;
  final searchButtonController = SearchButtonController();

  final MyCurrentLocation myCurrentLocation = MyCurrentLocation();

  List<SearchHistory> searchHistory = [];

  @override
  void initState() {
    super.initState();
    Get.put(
        searchButtonController); // Get.put: This makes it possible to access this object anywhere in the application.
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
          child: SingleChildScrollView(
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
              Obx(() => stationActive.value
                  ? _buildStationSelectionView()
                  : _buildAddressInputView()),
              const SizedBox(height: 24),
              Obx(() => SearchButton(
                  isLoading: searchButtonController.isLoading.value,
                  onPressedSearchButton: () async {
                    final searchButtonController =
                        Get.find<SearchButtonController>();
                    if (stationActive.value) {
                      searchButtonController.searchByStations(
                          context,
                          firstStationDropDown.value,
                          lastStationDropDown.value);
                    } else {
                      searchButtonController.searchByAddresses(
                          context, sourceAddress, destinationAddress);
                    }
                  })),
              const SizedBox(height: 6),
              LanguageToggleButton(languageController: languageController),
              const SizedBox(height: 16),
              _buildSearchHistorySection()
            ],
          ),
        ),
      )),
    );
  }

  Widget _buildStationSelectionView() {
    return Column(
      children: [
        StationsDropdown(
          selectedStation: firstStationDropDown.value,
          defaultHintText: 'Select first station',
          onSelectionChange: (value) {
            if (value.isNotEmpty) {
              firstStationDropDown.value = value.first;
            } else {
              firstStationDropDown.value = '';
            }
          },
        ),
        const SizedBox(height: 20),
        StationsDropdown(
          selectedStation: lastStationDropDown.value,
          defaultHintText: 'Select last station',
          onSelectionChange: (value) {
            if (value.isNotEmpty) {
              lastStationDropDown.value = value.first;
            } else {
              lastStationDropDown.value = '';
            }
          },
        ),
      ],
    );
  }

  Widget _buildAddressInputView() {
    return Column(
      children: [
        AddressFields(
          address: sourceAddress,
          hintText: 'Your current location',
        ),
        const SizedBox(height: 20),
        AddressFields(
          address: destinationAddress,
          hintText: 'Write destination',
        ),
      ],
    );
  }

  Widget _buildSearchHistorySection() {
    if (searchHistory.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.history, size: 18, color: AppColors.black),
            const SizedBox(width: 6),
            Text('Leatest search'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  fontWeight: FontWeight.w300,
                  color: AppColors.black,
                )),
          ],
        ),
        const SizedBox(height: 10),
        ...searchHistory.map((history) {
          return GestureDetector(
            onTap: () {
              ResultBottomSheet.showBottomSheet(
                context,
                history.firstStation,
                history.lastStation,
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 134, 134, 134)
                          .withOpacity(0.2),
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12)),
              child: FirstAndLastStationsRow(
                firstStationDropDown: history.firstStation,
                lastStationDropDown: history.lastStation,
              ),
            ),
          );
        }),
      ],
    );
  }
}
