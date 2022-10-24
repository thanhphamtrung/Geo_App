import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class LocationEntity {
  LatLng? yourLocation;
  LatLng? customerLocation;
  List<Polygon>? polygons;

  LocationEntity({
    this.yourLocation,
    this.customerLocation,
    this.polygons
  });
}
