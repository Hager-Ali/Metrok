// Packages
import 'package:geolocator/geolocator.dart';
import 'package:metrok/data/stations_data.dart';
// Classes
import 'package:metrok/models/lat_long_stations.dart';
import 'package:metrok/services/my_current_location.dart';

class NearestStation {

  Future<LatLongSations?> findNearestStation() async {

    MyCurrentLocation myLocObject = MyCurrentLocation();
    Position? currentLocation = await myLocObject.getLocation();

    if (currentLocation == null) {
      return null;
    }
    // _findNearestStation استدعاء دالة 
    LatLongSations nearestStation = getNearestStation(currentLocation.latitude, currentLocation.longitude, StationsData.stations);
    return nearestStation;
  }

  // دالة لحساب أقرب محطة
  LatLongSations getNearestStation(
      double currentLat, double currentLong, List<LatLongSations> stations) {
    // (المساحه بيني و بين أول محطه، المسافه بيني و بين تاني محطه و تشوف الاقصر و تقارنه باللي بعده) بتقارن بين كل اتنين reduce 
    return stations.reduce((a, b) {
      // LatLongSations لازم يرجعوا العنصر الكامل يعني نوعه a , b
      double distA = Geolocator.distanceBetween(
          currentLat, currentLong, a.lat, a.long); // a دي
      double distB = Geolocator.distanceBetween(
          currentLat, currentLong, b.lat, b.long); // b دي
      return distA < distB ? a : b; // If distA > distB return a else return b
    });
  }
}