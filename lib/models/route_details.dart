class RouteDetails {
  final String firstStation;
  final String lastStation;
  final String? lineDirection;
  final int? stationsNum;
  final String? ticketPrice;
  final String? arrivalTime;
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
  final bool? shortestRoute;

  const RouteDetails({
    required this.firstStation,
    required this.lastStation,
    this.ticketPrice,
    this.arrivalTime,
    this.shortestRoute,
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
}