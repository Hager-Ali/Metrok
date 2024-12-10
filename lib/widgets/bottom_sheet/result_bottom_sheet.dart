// Packages
import 'package:flutter/material.dart';
// My classes
import 'package:metrok/data/app_colors.dart';
import 'package:metrok/widgets/bottom_sheet/build_another_route_section.dart';
import 'package:metrok/services/ways_details.dart';
import 'package:metrok/widgets/bottom_sheet/first_and_last_stations_row.dart';
import 'package:metrok/widgets/bottom_sheet/first_title_in_bottom_sheet.dart';
import 'package:metrok/widgets/bottom_sheet/route_container_design.dart';
import 'package:metrok/widgets/bottom_sheet/select_container.dart';
// import 'more_details_bottom_sheet.dart';

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
                  singleContainer: waysDetails.singleContainer),
              const SizedBox(height: 8),
              _buildRouteContainer(waysDetails),
              const SizedBox(height: 18),
              // Third section in bottom sheet
              buildAnotherRouteSection(waysDetails)
            ],
          ),
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

Widget _buildRouteContainer(WaysDetails waysDetails) {
  return RouteContainerDesign(
      containerBorderColor: AppColors.blue,
      moreTextColor: AppColors.blue,
      moreButtonBgColor: AppColors.blue.withOpacity(0.2),
      containerContent: selectContainer(
          singleContainer: waysDetails.singleContainer,
          lineDirection: waysDetails.lineDirection,
          stationsNum: '${waysDetails.stationsNum}',
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
          stationsNum1: '${waysDetails.stationsNum1}',
          stationsNum2: '${waysDetails.stationsNum2}',
          secondRouteTicketPrice: waysDetails.secondRouteTicketPrice,
          secondRouteArrivalTime: waysDetails.secondRouteArrivalTime));
}
      ///////
      // Row(
      //   children: [
      //     Icon(Icons.train, size: 16, color: AppColors.grey),
      //     const SizedBox(width: 4),
      //     Text('Stations names'.tr,
      //         style: TextStyle(
      //             fontSize: 14,
      //             fontFamily: SelectFontFamily.getFontFamily(),
      //             color: AppColors.grey)),
      //   ],
      // ),
      // const SizedBox(height: 6),
      // Row(
      //   children: [
      //     Obx(() => Expanded(
      //           child: RichText(
      //             maxLines: 10,
      //             text: TextSpan(
      //               style: TextStyle(
      //                 fontSize: 14,
      //                 fontFamily:
      //                     SelectFontFamily.getFontFamily(),
      //                 color: AppColors.black,
      //               ),
      //               children:
      //                   waysDetails.stationsNames.map((station) {
      //                 return TextSpan(
      //                   text:
      //                       '${station.tr}, ', // إضافة فاصلة بعد كل محطة
      //                   style: TextStyle(
      //                     color: AppColors.black,
      //                   ),
      //                 );
      //               }).toList(),
      //             ),
      //           ),
      //         )),
      //   ],
      // ],
      // ),



//////////////////////////////////////


//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.lightGrey),
//                     borderRadius: BorderRadius.circular(12)),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Icon(
//                           Icons.directions_outlined,
//                           size: 16,
//                           color: AppColors.grey,
//                         ),
//                         const SizedBox(width: 4),
//                         Text('Direction: '.tr,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: SelectFontFamily.getFontFamily(),
//                                 color: AppColors.grey)),
//                         const SizedBox(width: 4),
//                         Obx(() => Text(waysDetails.lineDirection.value.tr,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: SelectFontFamily.getFontFamily(),
//                                 color: AppColors.black))),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       children: [
//                         Icon(Icons.tag, size: 16, color: AppColors.grey),
//                         const SizedBox(width: 4),
//                         Text('Number of stations: '.tr,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: SelectFontFamily.getFontFamily(),
//                                 color: AppColors.grey)),
//                         const SizedBox(width: 4),
//                         Obx(() => Text('${waysDetails.stationsNum.value}',
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: SelectFontFamily.getFontFamily(),
//                                 color: AppColors.black))),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       children: [
//                         Icon(Icons.attach_money,
//                             size: 16, color: AppColors.grey),
//                         const SizedBox(width: 4),
//                         Text('Ticket price: '.tr,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: SelectFontFamily.getFontFamily(),
//                                 color: AppColors.grey)),
//                         const SizedBox(width: 4),
//                         Obx(() => Text(waysDetails.ticketPrice.value.tr,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: SelectFontFamily.getFontFamily(),
//                                 color: AppColors.black))),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       children: [
//                         Icon(Icons.access_time,
//                             size: 16, color: AppColors.grey),
//                         const SizedBox(width: 4),
//                         Text('Arrival time: '.tr,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: SelectFontFamily.getFontFamily(),
//                                 color: AppColors.grey)),
//                         const SizedBox(width: 4),
//                         Obx(() => Text(waysDetails.arrivalTime.value,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: SelectFontFamily.getFontFamily(),
//                                 color: AppColors.black))),
//                       ],
//                     ),
//                     const SizedBox(height: 12),
//                     Row(
//                       children: [
//                         Container(
//                           padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
//                           decoration: BoxDecoration(
//                             color: AppColors.grey.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(16)
//                           ),
//                         child: Text('More',
//                         style: TextStyle(
//                                 fontSize: 14,
//                                 fontFamily: SelectFontFamily.getFontFamily(),
//                                 color: AppColors.black)
//                         ),
//                         )
//                       ],
//                     ),
//                     // Row(
//                     //   children: [
//                     //     Icon(Icons.train, size: 16, color: AppColors.grey),
//                     //     const SizedBox(width: 4),
//                     //     Text('Stations names'.tr,
//                     //         style: TextStyle(
//                     //             fontSize: 14,
//                     //             fontFamily: SelectFontFamily.getFontFamily(),
//                     //             color: AppColors.grey)),
//                     //   ],
//                     // ),
//                     // const SizedBox(height: 6),
//                     // Row(
//                     //   children: [
//                     //     Obx(() => Expanded(
//                     //           child: RichText(
//                     //             maxLines: 10,
//                     //             text: TextSpan(
//                     //               style: TextStyle(
//                     //                 fontSize: 14,
//                     //                 fontFamily:
//                     //                     SelectFontFamily.getFontFamily(),
//                     //                 color: AppColors.black,
//                     //               ),
//                     //               children:
//                     //                   waysDetails.stationsNames.map((station) {
//                     //                 return TextSpan(
//                     //                   text:
//                     //                       '${station.tr}, ', // إضافة فاصلة بعد كل محطة
//                     //                   style: TextStyle(
//                     //                     color: AppColors.black,
//                     //                   ),
//                     //                 );
//                     //               }).toList(),
//                     //             ),
//                     //           ),
//                     //         )),
//                     //   ],
//                     // )
//                   ],
//                 ),
//               ),
