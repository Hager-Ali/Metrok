// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';
import 'package:metrok/widgets/bottom_sheet/build_another_route_section.dart';
import 'package:metrok/services/ways_details.dart';
import 'package:metrok/widgets/bottom_sheet/first_and_last_stations_row.dart';
import 'package:metrok/widgets/bottom_sheet/first_title_in_bottom_sheet.dart';
import 'package:metrok/widgets/bottom_sheet/more_details_bottom_sheet.dart';
import 'package:metrok/widgets/bottom_sheet/route_container_design.dart';
import 'package:metrok/models/route_details.dart';
import 'package:metrok/widgets/bottom_sheet/select_container.dart';
class ResultBottomSheet extends StatelessWidget {
  final String firstStationDropDown;
  final String lastStationDropDown;

  const ResultBottomSheet({
    super.key,
    required this.firstStationDropDown,
    required this.lastStationDropDown,
  });

  static void showBottomSheet(
      BuildContext context, String firstStation, String lastStation) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => ResultBottomSheet(
        firstStationDropDown: firstStation,
        lastStationDropDown: lastStation,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final waysDetails = WaysDetails();
    waysDetails.getWays(firstStationDropDown, lastStationDropDown);

    return DraggableScrollableSheet(
      initialChildSize: 0.58, // Starts at 58% of the screen
      minChildSize: 0.14, // minimum size is 14% of the screen
      maxChildSize: 0.95, // maximum size is 95% of the screen
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              _buildDragHandle(),
              const SizedBox(
                height: 14,
              ),
              // First section in botthom sheet
              FirstAndLastStationsRow(
                  firstStationDropDown: firstStationDropDown,
                  lastStationDropDown: lastStationDropDown),
              const SizedBox(height: 18),
              // Second section in botthom sheet
              FirstTitleInBottomSheet(
                  singleContainer: waysDetails.singleContainer, secondExchangeStation: waysDetails.secondExchangeStation),
              const SizedBox(height: 8),
              _buildRouteContainer(context, waysDetails),
              const SizedBox(height: 18),
              // Third section in bottom sheet
              buildAnotherRouteSection(context, waysDetails,
                  firstStationDropDown, lastStationDropDown)
            ],
          ),
        );
      },
    );
  }

  Widget _buildRouteContainer(BuildContext context, WaysDetails waysDetails) {
    return RouteContainerDesign(
      containerBorderColor: AppColors.blue,
      moreTextColor: AppColors.blue,
      moreButtonBgColor: AppColors.blue.withOpacity(0.2),
      containerContent: selectContainer(
          singleContainer: waysDetails.singleContainer,
          lineDirection: waysDetails.lineDirection,
          stationsNum: waysDetails.stationsNum,
          ticketPrice: waysDetails.ticketPrice,
          arrivalTime: waysDetails.arrivalTime,
          otherRoutes: waysDetails.otherRoutes,
          shortesWay: waysDetails.shortesWay(
              waysDetails.stationsNum1, waysDetails.stationsNum2),
          firstExchangeStation: waysDetails.firstExchangeStation,
          secondExchangeStation: waysDetails.secondExchangeStation,
          firstRouteDirection: waysDetails.firstRouteDirection,
          firstRouteDirectionOtherRoute:
              waysDetails.firstRouteDirectionOtherRoute,
          secondRouteDirectionOtherRoute:
              waysDetails.secondRouteDirectionOtherRoute,
          secondRouteDirection: waysDetails.secondRouteDirection,
          stationsNum1: waysDetails.stationsNum1,
          stationsNum2: waysDetails.stationsNum2,
          secondRouteTicketPrice: waysDetails.secondRouteTicketPrice,
          secondRouteArrivalTime: waysDetails.secondRouteArrivalTime),
      moreButtonOnTap: () {
        Get.back();
        // Get the correct stations list based on route type
        Widget stationsListWidget;
        List<String> stations = [];
        String relevantExchangeStation = '';
        if (waysDetails.singleContainer) {
          stationsListWidget = stationsList(waysDetails.stationsNames, relevantExchangeStation);
        } else {
          // For multi-route, use mergedList1 or mergedList2 based on shortest route
          if (waysDetails.shortesWay(
                  waysDetails.stationsNum1, waysDetails.stationsNum2) ==
              'stationsNum1') {
            // Combine stations from first route (mergedList1)
            for (var list in waysDetails.mergedList1) {
              stations.addAll(list);
            }
            relevantExchangeStation = waysDetails.firstExchangeStation;
          } else {
            // Combine stations from second route (mergedList2)
            for (var list in waysDetails.mergedList2) {
              stations.addAll(list);
            }
            relevantExchangeStation = waysDetails.secondExchangeStation;
          }
          stationsListWidget = stationsList(stations, relevantExchangeStation);
        }

        MoreDetailsBottomSheet.show(
          context,
          routeDetails: RouteDetails(
            firstStation: firstStationDropDown,
            lastStation: lastStationDropDown,
            shortestRoute: true,
            lineDirection: waysDetails.lineDirection,
            stationsNum: waysDetails.stationsNum,
            ticketPrice: waysDetails.ticketPrice,
            arrivalTime: waysDetails.arrivalTime,
            firstExchangeStation: waysDetails.firstExchangeStation,
            secondExchangeStation: waysDetails.secondExchangeStation,
            firstRouteDirection: waysDetails.firstRouteDirection,
            secondRouteDirection: waysDetails.secondRouteDirection,
            firstRouteDirectionOtherRoute:
                waysDetails.firstRouteDirectionOtherRoute,
            secondRouteDirectionOtherRoute:
                waysDetails.secondRouteDirectionOtherRoute,
            stationsNum1: waysDetails.stationsNum1,
            stationsNum2: waysDetails.stationsNum2,
            secondRouteTicketPrice: waysDetails.secondRouteTicketPrice,
            secondRouteArrivalTime: waysDetails.secondRouteArrivalTime,
          ),
          stationsList: stationsListWidget,
        );
      },
    );
  }
}

Widget _buildDragHandle() {
  return Center(
    child: Container(
      width: 42,
      height: 4,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

Widget stationsList(List<String> stations, String exchangeStation) {
  // Remove duplicate exchange stations
  final notRepeatedStations = stations.toSet().toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: notRepeatedStations.asMap().entries.map((entry) {
      final index = entry.key;
      final station = entry.value;

      // Check if station is first, last, or exchange station
      final isFirstOrLast = (index == 0 || index == notRepeatedStations.length - 1);
      final isExchangeStation = station == exchangeStation;

      // Use blue color for first, last, and exchange stations
      final color = (isFirstOrLast || isExchangeStation)
          ? AppColors.blue
          : AppColors.grey;

      final fontSize = (isFirstOrLast || isExchangeStation) ? 14.0 : 12.0;
      final iconSize = (isFirstOrLast || isExchangeStation) ? 16.0 : 12.0;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: iconSize,
              color: color,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                station.tr,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: SelectFontFamily.getFontFamily(),
                  color: color,
                ),
              ),
            ),
          ],
        ),
      );
    }).toList(),
  );
}