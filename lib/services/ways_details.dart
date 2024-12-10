// Packages
import 'package:get/get.dart';
import 'package:dartx/dartx.dart';
// My classes
import 'package:metrok/data/stations_names.dart';
import 'package:metrok/data/lines_details.dart';
import 'package:metrok/Utils/price_calculator.dart';
import 'package:metrok/Utils/time_calculator.dart';

class WaysDetails extends GetxController {
  var lineDirection = '',
      firstRouteDirection = '',
      secondRouteDirection = '',
      firstRouteDirectionOtherRoute = '',
      secondRouteDirectionOtherRoute = '',
      ticketPrice = '',
      arrivalTime = '',
      secondRouteTicketPrice = '',
      secondRouteArrivalTime = '',
      firstExchangeStation = '',
      secondExchangeStation = '';
  var stationsNames = <String>[];
  var stationsNum = 0, stationsNum1 = 0, stationsNum2 = 0;
  var mergedList1 = <List<String>>[];
  var mergedList2 = <List<String>>[];
  var singleContainer = true;
  var otherRoutes = false;

  void getWays(String firstStationDropDown, String lastStationDropDown) {
    // First & last stations in line 1
    if (StationsNames.lineOne.contains(firstStationDropDown) &&
        StationsNames.lineOne.contains(lastStationDropDown)) {
      _singleLineRoad(
          firstStationDropDown: firstStationDropDown,
          lastStationDropDown: lastStationDropDown,
          line: StationsNames.lineOne,
          direction1: lineOne.direction1,
          direction2: lineOne.direction2);
    }
    // First & last stations in line 2
    else if (StationsNames.lineTwo.contains(firstStationDropDown) &&
        StationsNames.lineTwo.contains(lastStationDropDown)) {
      _singleLineRoad(
          firstStationDropDown: firstStationDropDown,
          lastStationDropDown: lastStationDropDown,
          line: StationsNames.lineTwo,
          direction1: lineTwo.direction1,
          direction2: lineTwo.direction2);
    }
    // First & last stations in line 3
    else if (StationsNames.lineThree.contains(firstStationDropDown) &&
        StationsNames.lineThree.contains(lastStationDropDown)) {
      _singleLineRoad(
          firstStationDropDown: firstStationDropDown,
          lastStationDropDown: lastStationDropDown,
          line: StationsNames.lineThree,
          direction1: lineThree.direction1,
          direction2: lineThree.direction2);
    }
    //  -------- First station in line 1 one & last stations in line 2 --------
    else if (StationsNames.lineOne.contains(firstStationDropDown) &&
        StationsNames.lineTwo.contains(lastStationDropDown)) {
      final startIndex = StationsNames.lineOne.indexOf(firstStationDropDown);
      final lastIndex = StationsNames.lineTwo.indexOf(lastStationDropDown);
      final lineOneSadatIndex = StationsNames.lineOne.indexOf('sadat');
      final lineTwoSadatIndex = StationsNames.lineTwo.indexOf('sadat');
      final lineOneShohadaaIndex = StationsNames.lineOne.indexOf('al-shohadaa');
      final lineTwoShohadaaIndex = StationsNames.lineTwo.indexOf('al-shohadaa');
      final firstLine = StationsNames.lineOne;
      final secondLine = StationsNames.lineTwo;

      firstExchangeStation = 'sadat';
      secondExchangeStation = 'al-shohadaa';

      singleContainer = false;
      otherRoutes = true;

      // First station in line 1 before Sadat
      if (startIndex < lineOneSadatIndex) {
        // Last station in line 2 before Sadat
        if (lastIndex < lineTwoSadatIndex) {
          firstRouteDirection = 'el-marg';
          secondRouteDirection = 'el-mounib';
          firstRouteDirectionOtherRoute = 'el-marg';
          secondRouteDirectionOtherRoute = 'el-mounib';

          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneSadatIndex,
              line2ExchangeStation: lineTwoSadatIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: false,
              line1ExchangeStation2: lineOneShohadaaIndex,
              line2ExchangeStation2: lineTwoShohadaaIndex,
              direction1SecondRoad: true,
              direction2SecondRoad: false);

          // Last station in line 2 between Sadat & Al Shohadaa
        } else if (lastIndex > lineTwoSadatIndex &&
            lastIndex < lineTwoShohadaaIndex) {
          firstRouteDirection = 'el-marg';
          secondRouteDirection = 'shubra';
          firstRouteDirectionOtherRoute = 'el-marg';
          secondRouteDirectionOtherRoute = 'el-mounib';

          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneSadatIndex,
              line2ExchangeStation: lineTwoSadatIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: true,
              line1ExchangeStation2: lineOneShohadaaIndex,
              line2ExchangeStation2: lineTwoShohadaaIndex,
              direction1SecondRoad: true,
              direction2SecondRoad: false);

          // Last station in line 2 after Al Shohadaa
        } else if (lastIndex > lineTwoShohadaaIndex) {
          firstRouteDirection = 'el-marg';
          secondRouteDirection = 'shubra';
          firstRouteDirectionOtherRoute = 'el-marg';
          secondRouteDirectionOtherRoute = 'shubra';

          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneSadatIndex,
              line2ExchangeStation: lineTwoSadatIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: true,
              line1ExchangeStation2: lineOneShohadaaIndex,
              line2ExchangeStation2: lineTwoShohadaaIndex,
              direction1SecondRoad: true,
              direction2SecondRoad: true);
        } // First station in line 1 between Sadat and Al Shohadaa
      } else if (startIndex < lineOneShohadaaIndex &&
          startIndex > lineOneSadatIndex) {
        // Last station in line 2 before sadat
        if (lastIndex < lineTwoSadatIndex) {
          firstRouteDirection = 'helwan';
          secondRouteDirection = 'el-mounib';
          firstRouteDirectionOtherRoute = 'el-marg';
          secondRouteDirectionOtherRoute = 'el-mounib';

          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneSadatIndex,
              line2ExchangeStation: lineTwoSadatIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: false,
              line1ExchangeStation2: lineOneShohadaaIndex,
              line2ExchangeStation2: lineTwoShohadaaIndex,
              direction1SecondRoad: true,
              direction2SecondRoad: false);

          // Last station in line 2 between Sadat and Al Shohadaa
        } else if (lastIndex > lineTwoSadatIndex) {
          if (lastIndex < lineTwoShohadaaIndex) {
            firstRouteDirection = 'helwan';
            secondRouteDirection = 'shubra';
            firstRouteDirectionOtherRoute = 'el-marg';
            secondRouteDirectionOtherRoute = 'el-mounib';

            _processRoute(
                anotherRoat: true,
                firstLine: firstLine,
                secondLine: secondLine,
                startIndex: startIndex,
                lastIndex: lastIndex,
                line1ExchangeStation: lineOneSadatIndex,
                line2ExchangeStation: lineTwoSadatIndex,
                direction1FirstRoad: false,
                direction2FirstRoad: true,
                line1ExchangeStation2: lineOneShohadaaIndex,
                line2ExchangeStation2: lineTwoShohadaaIndex,
                direction1SecondRoad: true,
                direction2SecondRoad: false);

            // Last station in line 2 after Al Shohadaa
          } else if (lastIndex > lineTwoShohadaaIndex) {
            firstRouteDirection = 'helwan';
            secondRouteDirection = 'shubra';
            firstRouteDirectionOtherRoute = 'el-marg';
            secondRouteDirectionOtherRoute = 'shubra';

            _processRoute(
                anotherRoat: true,
                firstLine: firstLine,
                secondLine: secondLine,
                startIndex: startIndex,
                lastIndex: lastIndex,
                line1ExchangeStation: lineOneSadatIndex,
                line2ExchangeStation: lineTwoSadatIndex,
                direction1FirstRoad: false,
                direction2FirstRoad: true,
                line1ExchangeStation2: lineOneShohadaaIndex,
                line2ExchangeStation2: lineTwoShohadaaIndex,
                direction1SecondRoad: true,
                direction2SecondRoad: true);
          }
        }
        // First station in line 1 after Al Shohadaa
      } else if (startIndex > lineOneShohadaaIndex) {
        // Last station in line 2 before Sadat
        if (lastIndex < lineTwoSadatIndex) {
          firstRouteDirection = 'helwan';
          secondRouteDirection = 'el-mounib';
          firstRouteDirectionOtherRoute = 'helwan';
          secondRouteDirectionOtherRoute = 'el-mounib';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneSadatIndex,
              line2ExchangeStation: lineTwoSadatIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: false,
              line1ExchangeStation2: lineOneShohadaaIndex,
              line2ExchangeStation2: lineTwoShohadaaIndex,
              direction1SecondRoad: false,
              direction2SecondRoad: false);

          // Last station in line 2 between Sadat and Al Shohadaa
        } else if (lastIndex > lineTwoSadatIndex &&
            lastIndex < lineTwoShohadaaIndex) {
          firstRouteDirection = 'helwan';
          secondRouteDirection = 'shubra';
          firstRouteDirectionOtherRoute = 'helwan';
          secondRouteDirectionOtherRoute = 'el-mounib';

          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneSadatIndex,
              line2ExchangeStation: lineTwoSadatIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: true,
              line1ExchangeStation2: lineOneShohadaaIndex,
              line2ExchangeStation2: lineTwoShohadaaIndex,
              direction1SecondRoad: false,
              direction2SecondRoad: false);

          // Last station in line 2 after Al Shohadaa
        } else if (lastIndex > lineTwoShohadaaIndex) {
          firstRouteDirection = 'helwan';
          secondRouteDirection = 'shubra';
          firstRouteDirectionOtherRoute = 'helwan';
          secondRouteDirectionOtherRoute = 'shubra';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneSadatIndex,
              line2ExchangeStation: lineTwoSadatIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: true,
              line1ExchangeStation2: lineOneShohadaaIndex,
              line2ExchangeStation2: lineTwoShohadaaIndex,
              direction1SecondRoad: false,
              direction2SecondRoad: true);
        }
      }
    }
    //  -------- First station in line 1 & last station in line 3 --------
    else if (StationsNames.lineOne.contains(firstStationDropDown) &&
        StationsNames.lineThree.contains(lastStationDropDown)) {
      final startIndex = StationsNames.lineOne.indexOf(firstStationDropDown);
      final lineOneNasserIndex = StationsNames.lineOne.indexOf('nasser');
      final lineThreeNasserIndex = StationsNames.lineThree.indexOf('nasser');
      final lastIndex = StationsNames.lineThree.indexOf(lastStationDropDown);
      final firstLine = StationsNames.lineOne;
      final secondLine = StationsNames.lineThree;
      firstExchangeStation = 'nasser';
      singleContainer = false;

      // First station in line 1 before Nasser
      if (startIndex < lineOneNasserIndex) {
        // Last station in line 3 before Nasser
        if (lastIndex < lineThreeNasserIndex) {
          firstRouteDirection = 'el-marg';
          secondRouteDirection = 'imbaba';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneNasserIndex,
              line2ExchangeStation: lineThreeNasserIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: false);
        }
        // Last station in line 3 after Nasser
        else if (lastIndex > lineThreeNasserIndex) {
          firstRouteDirection = 'el-marg';
          secondRouteDirection = 'shubra';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneNasserIndex,
              line2ExchangeStation: lineThreeNasserIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: true);
        }
        // First station in line 1 after Nasser
      } else if (startIndex > lineOneNasserIndex) {
        // Last station in line 3 before Nasser
        if (lastIndex < lineThreeNasserIndex) {
          firstRouteDirection = 'helwan';
          secondRouteDirection = 'el-mounib';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneNasserIndex,
              line2ExchangeStation: lineThreeNasserIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: true);

          // Last station in line 3 after Nasser
        } else if (lastIndex > lineThreeNasserIndex) {
          firstRouteDirection = 'helwan';
          secondRouteDirection = 'shubra';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineOneNasserIndex,
              line2ExchangeStation: lineThreeNasserIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: true);
        }
      }
    }
    //  -------- First station in line 2 & last station in line 1 --------
    else if (StationsNames.lineTwo.contains(firstStationDropDown) &&
        StationsNames.lineOne.contains(lastStationDropDown)) {
      final startIndex = StationsNames.lineTwo.indexOf(firstStationDropDown);
      final lastIndex = StationsNames.lineOne.indexOf(lastStationDropDown);
      final lineOneSadatIndex = StationsNames.lineOne.indexOf('sadat');
      final lineTwoSadatIndex = StationsNames.lineTwo.indexOf('sadat');
      final lineOneShohadaaIndex = StationsNames.lineOne.indexOf('al-shohadaa');
      final lineTwoShohadaaIndex = StationsNames.lineTwo.indexOf('al-shohadaa');
      final firstLine = StationsNames.lineTwo;
      final secondLine = StationsNames.lineOne;
      firstExchangeStation = 'sadat';
      secondExchangeStation = 'al-shohadaa';

      singleContainer = false;
      otherRoutes = true;

      // First station in line 2 before Sadat
      if (startIndex < lineTwoSadatIndex) {
        // Last station in line 1 before Sadat
        if (lastIndex < lineOneSadatIndex) {
          firstRouteDirection = 'shubra';
          secondRouteDirection = 'helwan';
          firstRouteDirectionOtherRoute = 'shubra';
          secondRouteDirectionOtherRoute = 'helwan';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoSadatIndex,
              line2ExchangeStation: lineOneSadatIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: false,
              line1ExchangeStation2: lineTwoShohadaaIndex,
              line2ExchangeStation2: lineOneShohadaaIndex,
              direction1SecondRoad: true,
              direction2SecondRoad: false);

          // Last station between Sadat & Al Shohadaa
        } else if (lastIndex > lineOneSadatIndex &&
            lastIndex < lineOneShohadaaIndex) {
          firstRouteDirection = 'shubra';
          secondRouteDirection = 'el-marg';
          firstRouteDirectionOtherRoute = 'shubra';
          secondRouteDirectionOtherRoute = 'helwan';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoSadatIndex,
              line2ExchangeStation: lineOneSadatIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: true,
              line1ExchangeStation2: lineTwoShohadaaIndex,
              line2ExchangeStation2: lineOneShohadaaIndex,
              direction1SecondRoad: true,
              direction2SecondRoad: false);

          // Last station in line 1 after Al Shohadaa
        } else if (lastIndex > lineTwoShohadaaIndex) {
          firstRouteDirection = 'shubra';
          secondRouteDirection = 'el-marg';
          firstRouteDirectionOtherRoute = 'shubra';
          secondRouteDirectionOtherRoute = 'el-marg';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoSadatIndex,
              line2ExchangeStation: lineOneSadatIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: true,
              line1ExchangeStation2: lineTwoShohadaaIndex,
              line2ExchangeStation2: lineOneShohadaaIndex,
              direction1SecondRoad: true,
              direction2SecondRoad: true);
        }
        // First station in line 2 between Sadat and Al Shohadaa
      } else if (startIndex < lineTwoShohadaaIndex &&
          startIndex > lineTwoSadatIndex) {
        // Last station in line 1 before sadat
        if (lastIndex < lineOneSadatIndex) {
          firstRouteDirection = 'el-mounib';
          secondRouteDirection = 'helwan';
          firstRouteDirectionOtherRoute = 'shubra';
          secondRouteDirectionOtherRoute = 'helwan';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoSadatIndex,
              line2ExchangeStation: lineOneSadatIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: false,
              line1ExchangeStation2: lineTwoShohadaaIndex,
              line2ExchangeStation2: lineOneShohadaaIndex,
              direction1SecondRoad: true,
              direction2SecondRoad: false);

          // Last station in line 1 between Sadat and Al Shohadaa
        } else if (lastIndex > lineOneSadatIndex) {
          if (lastIndex < lineOneShohadaaIndex) {
            firstRouteDirection = 'el-mounib';
            secondRouteDirection = 'el-marg';
            firstRouteDirectionOtherRoute = 'shubra';
            secondRouteDirectionOtherRoute = 'helwan';
            _processRoute(
                anotherRoat: true,
                firstLine: firstLine,
                secondLine: secondLine,
                startIndex: startIndex,
                lastIndex: lastIndex,
                line1ExchangeStation: lineTwoSadatIndex,
                line2ExchangeStation: lineOneSadatIndex,
                direction1FirstRoad: false,
                direction2FirstRoad: true,
                line1ExchangeStation2: lineTwoShohadaaIndex,
                line2ExchangeStation2: lineOneShohadaaIndex,
                direction1SecondRoad: true,
                direction2SecondRoad: false);

            // Last station in line 1 after Al Shohadaa
          } else if (lastIndex > lineOneShohadaaIndex) {
            firstRouteDirection = 'el-mounib';
            secondRouteDirection = 'el-marg';
            firstRouteDirectionOtherRoute = 'shubra';
            secondRouteDirectionOtherRoute = 'el-marg';
            _processRoute(
                anotherRoat: true,
                firstLine: firstLine,
                secondLine: secondLine,
                startIndex: startIndex,
                lastIndex: lastIndex,
                line1ExchangeStation: lineTwoSadatIndex,
                line2ExchangeStation: lineOneSadatIndex,
                direction1FirstRoad: false,
                direction2FirstRoad: true,
                line1ExchangeStation2: lineTwoShohadaaIndex,
                line2ExchangeStation2: lineOneShohadaaIndex,
                direction1SecondRoad: true,
                direction2SecondRoad: true);
          }
        }
        // First station in line 2 after Al Shohadaa
      } else if (startIndex > lineTwoShohadaaIndex) {
        // Last station in line 1 before Sadat
        if (lastIndex < lineOneSadatIndex) {
          firstRouteDirection = 'el-mounib';
          secondRouteDirection = 'helwan';
          firstRouteDirectionOtherRoute = 'el-mounib';
          secondRouteDirectionOtherRoute = 'helwan';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoSadatIndex,
              line2ExchangeStation: lineOneSadatIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: false,
              line1ExchangeStation2: lineTwoShohadaaIndex,
              line2ExchangeStation2: lineOneShohadaaIndex,
              direction1SecondRoad: false,
              direction2SecondRoad: false);

          // Last station in line 1 befor Sadat & Al Shohadaa
        } else if (lastIndex > lineOneSadatIndex &&
            lastIndex < lineOneShohadaaIndex) {
          firstRouteDirection = 'el-mounib';
          secondRouteDirection = 'el-marg';
          firstRouteDirectionOtherRoute = 'el-mounib';
          secondRouteDirectionOtherRoute = 'helwan';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoSadatIndex,
              line2ExchangeStation: lineOneSadatIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: true,
              line1ExchangeStation2: lineTwoShohadaaIndex,
              line2ExchangeStation2: lineOneShohadaaIndex,
              direction1SecondRoad: false,
              direction2SecondRoad: false);

          // Last station in line 1 after Al Shohadaa
        } else if (lastIndex > lineOneShohadaaIndex) {
          firstRouteDirection = 'el-mounib';
          secondRouteDirection = 'el-marg';
          firstRouteDirectionOtherRoute = 'el-mounib';
          secondRouteDirectionOtherRoute = 'el-marg';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoSadatIndex,
              line2ExchangeStation: lineOneSadatIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: true,
              line1ExchangeStation2: lineTwoShohadaaIndex,
              line2ExchangeStation2: lineOneShohadaaIndex,
              direction1SecondRoad: false,
              direction2SecondRoad: true);
        }
      }
    }
    //  -------- First station in line 2 & last station in line 3 --------
    else if (StationsNames.lineTwo.contains(firstStationDropDown) &&
        StationsNames.lineThree.contains(lastStationDropDown)) {
      final startIndex = StationsNames.lineTwo.indexOf(firstStationDropDown);
      final lineTwoAttabaIndex = StationsNames.lineTwo.indexOf('attaba');
      final lineThreeAttabaIndex = StationsNames.lineThree.indexOf('attaba');
      final lastIndex = StationsNames.lineThree.indexOf(lastStationDropDown);
      final firstLine = StationsNames.lineTwo;
      final secondLine = StationsNames.lineThree;
      firstExchangeStation = 'attaba';
      singleContainer = false;

      // First station in line 2 before Attaba
      if (startIndex < lineTwoAttabaIndex) {
        // Last station in line 3 before Attaba
        if (lastIndex < lineThreeAttabaIndex) {
          firstRouteDirection = 'shubra';
          secondRouteDirection = 'imbaba';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoAttabaIndex,
              line2ExchangeStation: lineThreeAttabaIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: false);
        }
        // Last station in line 3 after Attaba
        else if (lastIndex > lineThreeAttabaIndex) {
          firstRouteDirection = 'shubra';
          secondRouteDirection = 'airport';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoAttabaIndex,
              line2ExchangeStation: lineThreeAttabaIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: true);
        }
        // First station in line 2 after Attaba
      } else if (startIndex > lineTwoAttabaIndex) {
        // Last station in line 3 before Attaba
        if (lastIndex < lineThreeAttabaIndex) {
          firstRouteDirection = 'el-mounib';
          secondRouteDirection = 'imbaba';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoAttabaIndex,
              line2ExchangeStation: lineThreeAttabaIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: false);

          // Last station in line 3 after Attaba
        } else if (lastIndex > lineThreeAttabaIndex) {
          firstRouteDirection = 'el-mounib';
          secondRouteDirection = 'airport';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineTwoAttabaIndex,
              line2ExchangeStation: lineThreeAttabaIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: true);
        }
      }
    }
    //  -------- First station in line 3 & last station in line 1 --------
    else if (StationsNames.lineThree.contains(firstStationDropDown) &&
        StationsNames.lineOne.contains(lastStationDropDown)) {
      final startIndex = StationsNames.lineThree.indexOf(firstStationDropDown);
      final lastIndex = StationsNames.lineOne.indexOf(lastStationDropDown);
      final lineThreeNasserIndex = StationsNames.lineThree.indexOf('nasser');
      final lineOneNasserIndex = StationsNames.lineOne.indexOf('nasser');
      final firstLine = StationsNames.lineThree;
      final secondLine = StationsNames.lineOne;
      firstExchangeStation = 'nasser';
      singleContainer = false;

      // First station in line 3 before Nasser
      if (startIndex < lineThreeNasserIndex) {
        // Last station in line 1 before Nasser
        if (lastIndex < lineOneNasserIndex) {
          firstRouteDirection = 'airport';
          secondRouteDirection = 'helwan';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineThreeNasserIndex,
              line2ExchangeStation: lineOneNasserIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: false);
        }
        // Last station in line 1 after Nasser
        else if (lastIndex > lineOneNasserIndex) {
          firstRouteDirection = 'airport';
          secondRouteDirection = 'el-marg';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineThreeNasserIndex,
              line2ExchangeStation: lineOneNasserIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: true);
        }
        // First station in line 3 after Nasser
      } else if (startIndex > lineThreeNasserIndex) {
        // Last station in line 1 before Nasser
        if (lastIndex < lineOneNasserIndex) {
          firstRouteDirection = 'imbaba';
          secondRouteDirection = 'helwan';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineThreeNasserIndex,
              line2ExchangeStation: lineOneNasserIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: false);

          // Last station in line 1 after Nasser
        } else if (lastIndex > lineOneNasserIndex) {
          firstRouteDirection = 'imbaba';
          secondRouteDirection = 'el-marg';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineThreeNasserIndex,
              line2ExchangeStation: lineOneNasserIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: true);
        }
      }
    }
    //  -------- First station in line 3 & last station in line 2 --------
    else if (StationsNames.lineThree.contains(firstStationDropDown) &&
        StationsNames.lineTwo.contains(lastStationDropDown)) {
      final startIndex = StationsNames.lineThree.indexOf(firstStationDropDown);
      final lastIndex = StationsNames.lineTwo.indexOf(lastStationDropDown);
      final lineThreeAttabaIndex = StationsNames.lineThree.indexOf('attaba');
      final lineTwoAttabaIndex = StationsNames.lineTwo.indexOf('attaba');
      final firstLine = StationsNames.lineThree;
      final secondLine = StationsNames.lineTwo;
      firstExchangeStation = 'attaba';
      singleContainer = false;

      // First station in line 3 before Attaba
      if (startIndex < lineThreeAttabaIndex) {
        // Last station in line 2 before Attaba
        if (lastIndex < lineTwoAttabaIndex) {
          firstRouteDirection = 'airport';
          secondRouteDirection = 'el-mounib';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineThreeAttabaIndex,
              line2ExchangeStation: lineTwoAttabaIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: false);
        }
        // Last station in line 2 after Attaba
        else if (lastIndex > lineTwoAttabaIndex) {
          firstRouteDirection = 'airport';
          secondRouteDirection = 'shubra';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineThreeAttabaIndex,
              line2ExchangeStation: lineTwoAttabaIndex,
              direction1FirstRoad: true,
              direction2FirstRoad: true);
        }
        // First station in line 3 after Attaba
      } else if (startIndex > lineThreeAttabaIndex) {
        // Last station in line 2 before Attaba
        if (lastIndex < lineTwoAttabaIndex) {
          firstRouteDirection = 'imbaba';
          secondRouteDirection = 'el-mounib';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineThreeAttabaIndex,
              line2ExchangeStation: lineTwoAttabaIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: false);
          // Last station in line 2 after Attaba
        } else if (lastIndex > lineTwoAttabaIndex) {
          firstRouteDirection = 'imbaba';
          secondRouteDirection = 'shubra';
          _processRoute(
              anotherRoat: true,
              firstLine: firstLine,
              secondLine: secondLine,
              startIndex: startIndex,
              lastIndex: lastIndex,
              line1ExchangeStation: lineThreeAttabaIndex,
              line2ExchangeStation: lineTwoAttabaIndex,
              direction1FirstRoad: false,
              direction2FirstRoad: true);
        }
      }
    }
  }

  // Stations number function
  int countStations(List<List<String>> ways) {
    return ways.sumBy((list) => list.length);
    // sumBy: تُستخدم لحساب مجموع القيم بناءً على دالة معينة. في هذه الحالة، تقوم بجمع القيم التي يتم حسابها من خلال دالة تُمرر لها DartX داله من مكتبه
    // (list) => list.length: ways هي دالة تُعطى لكل قائمة داخلية في
    // تقوم هذه الدالة بإرجاع طول كل قائمة داخلية، أي عدد العناصر فيها و تجمع عدد عناصر كل القوائم
  }

  // Shortest way function
  String shortesWay(int stationsNum1, int stationsNum2) {
    return stationsNum1 == stationsNum2
        ? 'same'
        : stationsNum1 < stationsNum2
            ? 'stationsNum1'
            : 'stationsNum2';
  }

  // Get stations function
  List<List<String>> _getStationsList(
      {required List<String> firstLine,
      required List<String> secondLine,
      required final int startIndex,
      required final int lastIndex,
      required final int firstExchangeStation,
      required final secondExchangeStation,
      required final bool direction1,
      required final bool direction2}) {
    List<String> firstList = [], secondList = [];

    if (startIndex < firstExchangeStation && direction1 == true) {
      firstList =
          firstLine.sublist(startIndex, (firstExchangeStation + 1)).toList();
    } else if (startIndex < firstExchangeStation && direction1 == false) {
      firstList = firstLine
          .sublist(startIndex, (firstExchangeStation + 1))
          .reversed
          .toList();
    } else if (startIndex > firstExchangeStation && direction1 == false) {
      firstList = firstLine
          .sublist(firstExchangeStation, (startIndex + 1))
          .reversed
          .toList();
    }

    if (lastIndex < secondExchangeStation && direction2 == true) {
      secondList =
          secondLine.sublist(lastIndex, (secondExchangeStation + 1)).toList();
    } else if (lastIndex < secondExchangeStation && direction2 == false) {
      secondList = secondLine
          .sublist(lastIndex, (secondExchangeStation + 1))
          .reversed
          .toList();
    } else if (lastIndex > secondExchangeStation && direction2 == true) {
      secondList =
          secondLine.sublist(secondExchangeStation, (lastIndex + 1)).toList();
    }

    return [firstList, secondList];
  }

  void _singleLineRoad(
      {required String firstStationDropDown,
      required String lastStationDropDown,
      required List<String> line,
      required String direction1,
      required String direction2}) {
    final startIndex = line.indexOf(firstStationDropDown);
    final lastIndex = line.indexOf(lastStationDropDown);

    if (startIndex < lastIndex) {
      lineDirection = direction1;
      stationsNames = line.sublist(startIndex, (lastIndex + 1));
      stationsNum = (stationsNames.length) - 1;
      ticketPrice = PriceCalculator.calcTicketPrice(stationsNum);
      arrivalTime = TimeCalculator.calcArrivalTime(stationsNum);
    } else {
      lineDirection = direction2;
      stationsNames =
          line.sublist(lastIndex, (startIndex + 1)).reversed.toList();
      stationsNum = (stationsNames.length) - 1;
      ticketPrice = PriceCalculator.calcTicketPrice(stationsNum);
      arrivalTime = TimeCalculator.calcArrivalTime(stationsNum);
    }
  }

  void _secondRoad({
    required List<String> firstLine,
    required List<String> secondLine,
    required final int startIndex,
    required final int lastIndex,
    required final int line1ExchangeStation2,
    required final int line2ExchangeStation2,
    required final bool direction1SecondRoad,
    required final bool direction2SecondRoad,
  }) {
    mergedList2 = _getStationsList(
        firstLine: firstLine,
        secondLine: secondLine,
        startIndex: startIndex,
        lastIndex: lastIndex,
        firstExchangeStation: line1ExchangeStation2,
        secondExchangeStation: line2ExchangeStation2,
        direction1: direction1SecondRoad,
        direction2: direction2SecondRoad);

    stationsNum2 = countStations(mergedList2) - 2;
    secondRouteTicketPrice = PriceCalculator.calcTicketPrice(stationsNum2);
    secondRouteArrivalTime = TimeCalculator.calcArrivalTime(stationsNum2);
  }

  void _processRoute({
    required final bool anotherRoat,
    required List<String> firstLine,
    required List<String> secondLine,
    required final int startIndex,
    required final int lastIndex,
    required final int line1ExchangeStation,
    required final int line2ExchangeStation,
    required final bool direction1FirstRoad,
    required final bool direction2FirstRoad,
    int? line1ExchangeStation2,
    int? line2ExchangeStation2,
    bool? direction1SecondRoad,
    bool? direction2SecondRoad,
  }) {
    mergedList1 = _getStationsList(
        firstLine: firstLine,
        secondLine: secondLine,
        startIndex: startIndex,
        lastIndex: lastIndex,
        firstExchangeStation: line1ExchangeStation,
        secondExchangeStation: line2ExchangeStation,
        direction1: direction1FirstRoad,
        direction2: direction2FirstRoad);
    stationsNum1 = countStations(mergedList1) - 2;
    ticketPrice = PriceCalculator.calcTicketPrice(stationsNum1);
    arrivalTime = TimeCalculator.calcArrivalTime(stationsNum1);
    if (anotherRoat == true) {
      _secondRoad(
          firstLine: firstLine,
          secondLine: secondLine,
          startIndex: startIndex,
          lastIndex: lastIndex,
          line1ExchangeStation2:
              line1ExchangeStation2 ?? 0, // استخدام قيمة افتراضية لو null
          line2ExchangeStation2:
              line2ExchangeStation2 ?? 0, // استخدام قيمة افتراضية لو null
          direction1SecondRoad:
              direction1SecondRoad ?? false, // تأكيد وجود قيمة افتراضية لو null
          direction2SecondRoad: direction2SecondRoad ??
              false); // تأكيد وجود قيمة افتراضية لو null);
    }
  }
}
