class RouteDetails {
  final String firstStation;
  final String lastStation;
  final String? lineDirection;
  final int? stationsNum;
  final String ticketPrice;
  final String arrivalTime;
  final String? firstExchangeStation;
  final String? secondExchangeStation;
  final String? firstRouteDirection;
  final String? secondRouteDirection;
  final String? firstRouteDirectionOtherRoute;
  final String? secondRouteDirectionOtherRoute;
  final int? stationsNum1;
  final int? stationsNum2;
  final String? secondRouteTicketPrice;
  final String? secondRouteArrivalTime;
  final bool shortestRoute;

  const RouteDetails({
    required this.firstStation,
    required this.lastStation,
    required this.ticketPrice,
    required this.arrivalTime,
    required this.shortestRoute,
    this.lineDirection,
    this.stationsNum,
    this.firstExchangeStation,
    this.secondExchangeStation,
    this.firstRouteDirection,
    this.secondRouteDirection,
    this.firstRouteDirectionOtherRoute,
    this.secondRouteDirectionOtherRoute,
    this.stationsNum1,
    this.stationsNum2,
    this.secondRouteTicketPrice,
    this.secondRouteArrivalTime,
  });

  bool get isSingleRoute => lineDirection?.isNotEmpty ?? false;

  // @override
  // bool operator ==(Object other) { // operator == is used to comparing two objects of the same type
  //   if (identical(this, other)) return true;
    
  //   return other is RouteDetails && // other is used to check if the other object is of the same type of (RouteDetails)
  //     other.firstStation == firstStation &&
  //     other.lastStation == lastStation &&
  //     other.lineDirection == lineDirection &&
  //     other.stationsNum == stationsNum &&
  //     other.ticketPrice == ticketPrice &&
  //     other.arrivalTime == arrivalTime &&
  //     other.firstExchangeStation == firstExchangeStation &&
  //     other.secondExchangeStation == secondExchangeStation &&
  //     other.firstRouteDirection == firstRouteDirection &&
  //     other.secondRouteDirection == secondRouteDirection &&
  //     other.firstRouteDirectionOtherRoute == firstRouteDirectionOtherRoute &&
  //     other.secondRouteDirectionOtherRoute == secondRouteDirectionOtherRoute &&
  //     other.stationsNum1 == stationsNum1 &&
  //     other.stationsNum2 == stationsNum2 &&
  //     other.secondRouteTicketPrice == secondRouteTicketPrice &&
  //     other.secondRouteArrivalTime == secondRouteArrivalTime &&
  //     other.shortestRoute == shortestRoute;
  // }

  // @override
  // int get hashCode { // hashCode is a unique number (Integer) that is generated for each object in Dart.
  //   return Object.hashAll([
  //     firstStation,
  //     lastStation,
  //     lineDirection,
  //     stationsNum,
  //     ticketPrice,
  //     arrivalTime,
  //     firstExchangeStation,
  //     secondExchangeStation,
  //     firstRouteDirection,
  //     secondRouteDirection,
  //     firstRouteDirectionOtherRoute,
  //     secondRouteDirectionOtherRoute,
  //     stationsNum1,
  //     stationsNum2,
  //     secondRouteTicketPrice,
  //     secondRouteArrivalTime,
  //     shortestRoute,
  //   ]);
  // }
}