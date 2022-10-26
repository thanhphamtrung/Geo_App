import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../cores/helpers/permission_helper.dart';
import '../../domains/adapters/map_repo_adapter.dart';
import '../../domains/entity/location_entity.dart';

class ProfileController extends GetxController {
  final IMapRepository repository;

  ProfileController({required this.repository});

  RxDouble lat = 0.0.obs;
  RxDouble long = 0.0.obs;
  Rx<MapEntity> map = MapEntity().obs;

  @override
  void onInit() async {
    map.value = MapEntity(
      yourLocation: LatLng(-37.885371, 145.07845),
      customerLocation: LatLng(-37.9, 145.07845),
    );
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

  Future<bool> saveCustomerLocation() async {
    try {
      return await repository.saveCustomerLocation(map.value.customerLocation!);
    } catch (e) {
      return false;
    }
  }

  
}