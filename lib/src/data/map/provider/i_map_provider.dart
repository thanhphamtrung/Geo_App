import 'package:latlong2/latlong.dart';

import '../../models/pickup_location_model.dart';

abstract class IMapProvider {
  Future<ListPickupLocationModel?> getDataFromDataJsonFile();
  Future<bool> saveLocation(LatLng latLng);
  Future<String?> getDirectionRouteData({required LatLng yourLocation, required LatLng customerLocation});
}
