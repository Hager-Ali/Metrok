// Packages
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MyCurrentLocation {
  Future<Position?> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // check permissions first
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error'.tr, 'Location permissions are denied'.tr);
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error'.tr,
          'Location permissions are permanently denied, we cannot request permissions.'.tr);
      return null;
    }

    // check location services
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      // Ask the user to open location settings
      await Geolocator.openLocationSettings();

      // check again if the service is enabled after the user opens the settings
      if (!serviceEnabled) {
        Get.snackbar('Error'.tr,
            'Location services are not enabled. Please enable location services.'.tr,
            duration: const Duration(seconds: 7));
        return null;
      }
    }

    // After ensuring permissions and location services are enabled, we retrieve the location
    return await Geolocator.getCurrentPosition();
  }
}
