// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/data/select_font_family.dart';
import 'package:metrok/widgets/bottom_sheet/more_details_bottom_sheet.dart';
import 'package:metrok/widgets/bottom_sheet/result_bottom_sheet.dart';
import 'package:metrok/models/route_details.dart';
import 'package:metrok/widgets/bottom_sheet/select_other_route.dart';
import 'package:metrok/services/ways_details.dart';
import 'package:metrok/widgets/bottom_sheet/route_container_design.dart';

Widget buildAnotherRouteSection(BuildContext context, WaysDetails waysDetails,
    String firstStation, String lastStation) {
  if (waysDetails.singleContainer == false && waysDetails.otherRoutes == true) {
    return Column(
      children: [
        _secondTitleInBottomSheet(),
        const SizedBox(height: 8),
        RouteContainerDesign(
          moreTextColor: AppColors.black,
          moreButtonBgColor: AppColors.grey.withOpacity(0.2),
          containerBorderColor: AppColors.lightGrey,
          containerContent: selectOtherRoute(
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
              ticketPrice: waysDetails.ticketPrice,
              secondRouteTicketPrice: waysDetails.secondRouteTicketPrice,
              arrivalTime: waysDetails.arrivalTime,
              secondRouteArrivalTime: waysDetails.secondRouteArrivalTime),
          moreButtonOnTap: () {
            Get.back();
            // Get stations for alternative route
            List<String> stations = [];
            for (var list in waysDetails.mergedList2) {
              stations.addAll(list);
            }

            MoreDetailsBottomSheet.show(
              context,
              routeDetails: RouteDetails(
                firstStation: firstStation,
                lastStation: lastStation,
                shortestRoute: false,
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
              stationsList: stationsList(stations, waysDetails.secondExchangeStation ),
            );
          },
        )
      ],
    );
  } else {
    return SizedBox();
  }
}

Widget _secondTitleInBottomSheet() {
  return Row(
    children: [
      const SizedBox(width: 10),
      Icon(
        Icons.circle,
        size: 14,
        color: AppColors.black,
      ),
      const SizedBox(width: 8),
      Text('Another route'.tr,
          style: TextStyle(
              fontSize: 14,
              fontFamily: SelectFontFamily.getFontFamily(),
              color: AppColors.black))
    ],
  );
}
