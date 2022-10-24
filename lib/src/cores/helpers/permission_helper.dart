import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:geolocator/geolocator.dart';

class PermissionHelper {
  static Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      safePrint('Location services are disabled. Please enable the services');
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        safePrint('Location permissions are denied');
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      safePrint(
          'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }
    return true;
  }
}
