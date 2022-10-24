import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../cores/helpers/permission_helper.dart';

class HomeController extends GetxController {
  RxDouble position = 0.0.obs;

  late Rx<LatLng> yourLocation;
  late Rx<LatLng> customerLocation;

  @override
  void onInit() async {
    yourLocation = LatLng(-37.885371, 145.07845).obs;
    customerLocation = LatLng(-37.9, 145.07845).obs;
    try {
      var p = await getCurrentPosition();
      position = p!.latitude.obs;
    } catch (e) {
      safePrint(e);
    }
    update();
    super.onInit();
  }

  Future<Position?> getCurrentPosition() async {
    final hasPermission = await PermissionHelper.handleLocationPermission();
    if (!hasPermission) return null;
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      safePrint(e);
      return null;
    }
  }
}
