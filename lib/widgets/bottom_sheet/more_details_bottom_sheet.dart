import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';
import 'package:metrok/widgets/bottom_sheet/build_drag_handle.dart';
import 'package:metrok/widgets/bottom_sheet/first_and_last_stations_row.dart';
import 'package:metrok/widgets/bottom_sheet/multi_routes.dart';
import 'package:metrok/models/route_details.dart';
import 'package:metrok/widgets/bottom_sheet/single_route.dart';

class MoreDetailsBottomSheet extends StatelessWidget {
  final RouteDetails routeDetails;
  final Widget stationsList;

  const MoreDetailsBottomSheet({
    super.key,
    required this.routeDetails,
    required this.stationsList,
  });

  static void show(
    BuildContext context, {
    required RouteDetails routeDetails,
    required Widget stationsList,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => MoreDetailsBottomSheet(
        routeDetails: routeDetails,
        stationsList: stationsList,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.95,
      minChildSize: 0.14,
      maxChildSize: 0.95,
      expand: false,
      builder: _buildSheetContent,
    );
  }

  Widget _buildSheetContent(BuildContext context, ScrollController scrollController) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: ListView(
        controller: scrollController,
        children: [
          buildDragHandle(),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                'Route Summary'.tr,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: Get.locale?.languageCode == 'ar' ? 'Cairo' : 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: _buildCloseButton(context),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            height: 1,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 238, 238, 238),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Start and End Stations'.tr,
            style: TextStyle(
              fontSize: 14,
              fontFamily: SelectFontFamily.getFontFamily(),
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),
          _buildStationsRow(),
          const SizedBox(height: 16),
          Text(
            'Journey Information'.tr,
            style: TextStyle(
              fontSize: 14,
              fontFamily: SelectFontFamily.getFontFamily(),
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),
          _buildRouteDetailsSection(),
          const SizedBox(height: 16),
          Text(
            'Stations you will pass through'.tr,
            style: TextStyle(
              fontSize: 14,
              fontFamily: SelectFontFamily.getFontFamily(),
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),
          _buildStationsList(),
        ],
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: CloseButton(
        size: 34,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildStationsRow() {
    return ContentContainer(
      height: 100,
      child: FirstAndLastStationsRow(
        firstStationDropDown: routeDetails.firstStation,
        lastStationDropDown: routeDetails.lastStation,
      ),
    );
  }

  Widget _buildRouteDetailsSection() {
    return ContentContainer(
      child: _buildRouteDetails(),
    );
  }

  Widget _buildRouteDetails() {
    if (routeDetails.isSingleRoute) {
      return singleRoute(
        lineDirection: routeDetails.lineDirection!,
        stationsNum: routeDetails.stationsNum!,
        ticketPrice: routeDetails.ticketPrice,
        arrivalTime: routeDetails.arrivalTime,
      );
    }

    return multiRoutes(
      exchangeStation: routeDetails.shortestRoute 
          ? routeDetails.firstExchangeStation!
          : routeDetails.secondExchangeStation!,
      firstDirection: routeDetails.shortestRoute
          ? routeDetails.firstRouteDirection!
          : routeDetails.firstRouteDirectionOtherRoute!,
      secondDirection: routeDetails.shortestRoute
          ? routeDetails.secondRouteDirection!
          : routeDetails.secondRouteDirectionOtherRoute!,
      stationsNum: routeDetails.shortestRoute
          ? routeDetails.stationsNum1!
          : routeDetails.stationsNum2 ?? 0,
      ticketPrice: routeDetails.shortestRoute
          ? routeDetails.ticketPrice
          : routeDetails.secondRouteTicketPrice ?? routeDetails.ticketPrice,
      arrivalTime: routeDetails.shortestRoute
          ? routeDetails.arrivalTime
          : routeDetails.secondRouteArrivalTime ?? routeDetails.arrivalTime,
    );
  }

  Widget _buildStationsList() {
    return ContentContainer(
      child: stationsList,
    );
  }
}

class ContentContainer extends StatelessWidget {
  final Widget child;
  final double? height;

  const ContentContainer({
    super.key,
    required this.child,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 238, 238),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

class CloseButton extends StatelessWidget {
  final double size;
  final VoidCallback onPressed;

  const CloseButton({
    super.key,
    required this.size,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 238, 238, 238),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(Icons.close, color: AppColors.grey, size: 18),
        onPressed: onPressed,
      ),
    );
  }
}