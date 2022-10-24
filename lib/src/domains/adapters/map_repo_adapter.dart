import 'package:geojson/geojson.dart';

abstract class IMapRepository {
  Future<GeoJson?> getGeoData();
}
