// Packages 
import 'dart:async';
import 'package:geolocator/geolocator.dart';

class LocationServiceManager {
  
  StreamSubscription<ServiceStatus>? serviceStatusStream;

  void startLocationServiceListener(Function onEnabled, Function onDisabled) {
    serviceStatusStream = Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
      if (status == ServiceStatus.enabled) {
        onEnabled();
      } else {
        onDisabled();
      }
    });
  }

  void stopLocationServiceListener() {
    serviceStatusStream?.cancel();
  }
}