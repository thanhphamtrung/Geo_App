import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapEntity {
  LatLng? yourLocation;
  LatLng? customerLocation;
  List<Polygon>? polygons;
  List<Polyline>? polyLines;

  MapEntity({
    this.yourLocation,
    this.customerLocation,
    this.polygons,
    this.polyLines,
  });
}
