import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrok/widgets/bottom_sheet/multi_routes.dart';
import 'package:metrok/widgets/bottom_sheet/select_shortest_route.dart';
import 'package:metrok/widgets/bottom_sheet/single_route.dart';

Widget selectContainer({
    required bool singleContainer,
    required String lineDirection,
    required int stationsNum,
    required String ticketPrice,
    required String arrivalTime,
    required bool otherRoutes,
    required String shortesWay,
    required String firstExchangeStation,
    required String secondExchangeStation,
    required String firstRouteDirection,
    required String firstRouteDirectionOtherRoute,
    required String secondRouteDirectionOtherRoute,
    required String secondRouteDirection,
    required int stationsNum1,
    required int stationsNum2,
    required String secondRouteTicketPrice,
    required String secondRouteArrivalTime,
  }) {
    if (singleContainer == true) {
      return singleRoute(
          lineDirection: lineDirection.tr,
          stationsNum: stationsNum,
          ticketPrice: ticketPrice.tr,
          arrivalTime: arrivalTime.tr);
    } else if (singleContainer == false && otherRoutes == true) {
      return selectShortestRoute(
          shortesWay: shortesWay,
          firstExchangeStation: firstExchangeStation,
          secondExchangeStation: secondExchangeStation,
          firstRouteDirection: firstRouteDirection,
          firstRouteDirectionOtherRoute: firstRouteDirectionOtherRoute,
          secondRouteDirectionOtherRoute: secondRouteDirectionOtherRoute,
          secondRouteDirection: secondRouteDirection,
          stationsNum1: stationsNum1,
          stationsNum2: stationsNum2,
          ticketPrice: ticketPrice,
          secondRouteTicketPrice: secondRouteTicketPrice,
          arrivalTime: arrivalTime,
          secondRouteArrivalTime: secondRouteArrivalTime);
    } else {
      return multiRoutes(
          exchangeStation: firstExchangeStation,
          firstDirection: firstRouteDirection,
          secondDirection: secondRouteDirection,
          stationsNum: stationsNum1,
          ticketPrice: ticketPrice,
          arrivalTime: arrivalTime);
    }
  }