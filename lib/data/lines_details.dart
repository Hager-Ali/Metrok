import 'package:get/get.dart';
import 'package:metrok/data/exchange_stations.dart';
import 'package:metrok/data/stations_names.dart';
import 'package:metrok/models/metro_line.dart';

final lineOne = MetroLine(
  name: 'Line 1',
  stations: StationsNames.lineOne,
  direction1: 'el-marg'.tr,
  direction2: 'helwan'.tr,
  sadatIndex: StationsNames.lineOne.indexOf(ExchangeStations.sadat),
  nasserIndex: StationsNames.lineOne.indexOf(ExchangeStations.nasser),
  alShohadaaIndex: StationsNames.lineOne.indexOf(ExchangeStations.alShohadaa),
);

final lineTwo = MetroLine(
  name: 'Line 2',
  stations: StationsNames.lineTwo,
  direction1: 'shubra'.tr,
  direction2: 'el-mounib'.tr,
  sadatIndex: StationsNames.lineTwo.indexOf(ExchangeStations.sadat),
  attabaIndex: StationsNames.lineTwo.indexOf(ExchangeStations.attaba),
  alShohadaaIndex: StationsNames.lineTwo.indexOf(ExchangeStations.alShohadaa),
);

final lineThree = MetroLine(
  name: 'Line 3',
  stations: StationsNames.lineThree,
  direction1: 'airport'.tr,
  direction2: 'imbaba'.tr,
  attabaIndex: StationsNames.lineThree.indexOf(ExchangeStations.attaba),
  nasserIndex: StationsNames.lineThree.indexOf(ExchangeStations.nasser),
);