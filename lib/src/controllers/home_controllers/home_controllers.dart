import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geojson/geojson.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../cores/helpers/permission_helper.dart';
import '../../domains/adapters/map_repo_adapter.dart';

class HomeController extends GetxController {
  final IMapRepository repository;

  HomeController({required this.repository});

  RxDouble position = 0.0.obs;

  late Rx<LatLng> yourLocation;
  late Rx<LatLng> customerLocation;
  var listPolygon = <Polygon>[].obs;

  @override
  void onInit() async {
    yourLocation = LatLng(-37.885371, 145.07845).obs;
    customerLocation = LatLng(-37.9, 145.07845).obs;
    listPolygon.value = await getPickUpLocation();
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

  Future<List<Polygon>> getPickUpLocation() async {
    try {
      List<Polygon> listPolygon = [];
      GeoJson? geo = await repository.getGeoData();
      if (geo != null) {
        for (var polygon in geo.polygons) {
          List<LatLng> listLatLng = [];
          for (var geoSerie in polygon.geoSeries) {
            for (var geoPoint in geoSerie.geoPoints) {
              listLatLng.add(geoPoint.toLatLng() as LatLng);
            }
          }

          listPolygon.add(
              Polygon(points: listLatLng, color: Colors.red, isFilled: true));
        }
      }
      return listPolygon;
    } catch (e) {
      safePrint(e);
      return listPolygon;
    }
  }
}
