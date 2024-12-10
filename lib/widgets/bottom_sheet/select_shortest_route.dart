  import 'package:flutter/material.dart';
import 'package:metrok/widgets/bottom_sheet/multi_routes.dart';

Widget selectShortestRoute({
    required final String shortesWay,
    required final String firstExchangeStation,
    required final String secondExchangeStation,
    required final String firstRouteDirection,
    required final String firstRouteDirectionOtherRoute,
    required final String secondRouteDirectionOtherRoute,
    required final String secondRouteDirection,
    required final String stationsNum1,
    required final String stationsNum2,
    required final String ticketPrice,
    required final String secondRouteTicketPrice,
    required final String arrivalTime,
    required final String secondRouteArrivalTime,
  }) {
    if (shortesWay == 'stationsNum1') {
      return multiRoutes(
          exchangeStation: firstExchangeStation,
          firstDirection: firstRouteDirection,
          secondDirection: secondRouteDirection,
          stationsNum: stationsNum1,
          ticketPrice: ticketPrice,
          arrivalTime: arrivalTime);
    } else if (shortesWay == 'stationsNum2') {
      return multiRoutes(
          exchangeStation: secondExchangeStation,
          firstDirection: firstRouteDirectionOtherRoute,
          secondDirection: secondRouteDirectionOtherRoute,
          stationsNum: stationsNum2,
          ticketPrice: secondRouteTicketPrice,
          arrivalTime: secondRouteArrivalTime);
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