import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geojson/geojson.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../cores/helpers/permission_helper.dart';
import '../../domains/adapters/map_repo_adapter.dart';
import '../../domains/entity/location_entity.dart';

class HomeController extends GetxController {
  final IMapRepository repository;

  HomeController({required this.repository});

  var listPolygon = <Polygon>[].obs;

  Rx<MapEntity> map = MapEntity().obs;

  @override
  void onInit() async {
    map.value = MapEntity(
      yourLocation: LatLng(-37.885371, 145.07845),
      customerLocation: LatLng(-37.9, 145.07845),
      polygons: await getPickUpLocationPolygon(),
    );
    // yourLocation = LatLng(-37.885371, 145.07845).obs;
    // customerLocation = LatLng(-37.9, 145.07845).obs;
    // listPolygon.value = await getPickUpLocationPolygon();
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

  Future<List<Polygon>> getPickUpLocationPolygon() async {
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
