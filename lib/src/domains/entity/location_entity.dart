import 'package:flutter_map/plugin_api.dart';
import 'package:geojson/geojson.dart';
import 'package:latlong2/latlong.dart';

class MapEntity {
  LatLng? yourLocation;
  LatLng? customerLocation;
  List<Polygon>? polygons;

  MapEntity({
    this.yourLocation,
    this.customerLocation,
    this.polygons,
  });
}
