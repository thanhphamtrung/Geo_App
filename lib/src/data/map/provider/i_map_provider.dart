import 'package:latlong2/latlong.dart';

import '../../models/pickup_location_model.dart';

abstract class IMapProvider {
  Future<ListPickupLocationModel?> getDataFromDataJsonFile();
  Future<bool> saveLocation(LatLng latLng);
  Future<bool> updateLocation(String id ,LatLng latLng);
  Future<bool> readLocationsFromDatabase();
  Future<String?> getDirectionRouteData({required LatLng yourLocation, required LatLng customerLocation});
}
