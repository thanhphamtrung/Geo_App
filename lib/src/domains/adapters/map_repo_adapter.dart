import 'package:geojson/geojson.dart';
import 'package:latlong2/latlong.dart';

abstract class IMapRepository {
  Future<GeoJson?> getGeoData();
  Future<bool> saveCustomerLocation(LatLng latLng);
  Future<GeoJson?> getDirectionRoutes(
      {required LatLng yourLocation, required LatLng customerLocation});
}
