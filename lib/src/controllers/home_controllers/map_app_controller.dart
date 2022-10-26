import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geojson/geojson.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../cores/helpers/permission_helper.dart';
import '../../domains/adapters/authentication/authentication_repo_adapter.dart';
import '../../domains/adapters/map/map_repo_adapter.dart';
import '../../domains/entity/location_entity.dart';

class MapAppController extends GetxController {
  final IMapRepository repository;
  final IAuthenticationRepository authenticationRepository;

  MapAppController({
    required this.repository,
    required this.authenticationRepository,
  });

  var isInsidePickUpLocation = false.obs;

  Rx<MapEntity> map = MapEntity().obs;

  @override
  void onInit() async {
    map.value = MapEntity(
      yourLocation: LatLng(-37.885371, 145.07845),
      customerLocation: LatLng(-37.9, 145.07845),
      polygons: await getPickUpLocationPolygon(),
      polyLines: await getDirectionRoutePolyLine(
          yourLocation: LatLng(-37.885371, 145.07845),
          customerLocation: LatLng(-37.9, 145.07845)),
    );

    super.onInit();
  }

  Future<bool> signOut() async {
    return await authenticationRepository.userSignOut();
  }

  Future<Position?> getCurrentPosition() async {
    final hasPermission = await PermissionHelper.handleLocationPermission();
    if (!hasPermission) return null;
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
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

  Future<bool> saveCustomerCurrentLocation() async {
    try {
      var currentLocation = await getCurrentPosition();
      map.value.customerLocation?.latitude = currentLocation!.latitude;
      map.value.customerLocation?.longitude = currentLocation!.longitude;
      return await repository.saveCustomerLocation(map.value.customerLocation!);
    } catch (e) {
      return false;
    }
  }

  Future<bool> updateCustomerLocation() async {
    try {
      return await repository.updateCustomerLocation(
          '1', map.value.customerLocation!);
    } catch (e) {
      return false;
    }
  }

  Future<bool> readCustomerLocations() async {
    try {
      return await repository.readCustomerLocations();
    } catch (e) {
      return false;
    }
  }

  Future<List<Polygon>> getPickUpLocationPolygon() async {
    List<Polygon> listPolygon = [];
    try {
      GeoJson? geo = await repository.getGeoData();
      if (geo != null) {
        for (var polygon in geo.polygons) {
          List<LatLng> listLatLng = [];
          for (var geoSerie in polygon.geoSeries) {
            for (var geoPoint in geoSerie.geoPoints) {
              listLatLng.add(geoPoint.toLatLng() as LatLng);
            }
          }

          listPolygon.add(Polygon(points: listLatLng, color: Colors.red));
        }
      }
      return listPolygon;
    } catch (e) {
      safePrint(e);
      return listPolygon;
    }
  }

  Future<List<Polyline>> getDirectionRoutePolyLine(
      {required LatLng yourLocation, required LatLng customerLocation}) async {
    List<Polyline> polyLines = [];
    try {
      GeoJson? geo = await repository.getDirectionRoutes(
          yourLocation: yourLocation, customerLocation: customerLocation);
      if (geo != null) {
        for (var polyLine in geo.lines) {
          List<LatLng> listLatLng = [];
          for (var point in polyLine.geoSerie!.geoPoints) {
            listLatLng.add(point.toLatLng() as LatLng);
          }

          polyLines.add(Polyline(
              points: listLatLng,
              color: Colors.orange.shade300,
              borderStrokeWidth: 3,
              borderColor: Colors.orange));
        }
      }
      return polyLines;
    } catch (e) {
      safePrint(e);
      return polyLines;
    }
  }

  Future updateDirectionRoute(
      {required LatLng yourLocation, required LatLng customerLocation}) async {
    map.value.polyLines = await getDirectionRoutePolyLine(
        customerLocation: customerLocation, yourLocation: yourLocation);
  }

  Future getEtaDistance() async {
    var etaAndDistance = await repository.getEtaDistance(
        yourLocation: map.value.yourLocation!,
        customerLocation: map.value.customerLocation!);
    map.value.eta = etaAndDistance[0];
    map.value.distance = etaAndDistance[1];
  }

  void checkIfInsidePickupLocation() {
    bool isInside = checkIfValidMarker(
        map.value.customerLocation!, map.value.polygons!.first.points);
    isInsidePickUpLocation.value = isInside;
  }

  bool checkIfValidMarker(LatLng tap, List<LatLng> vertices) {
    int intersectCount = 0;
    for (int j = 0; j < vertices.length - 1; j++) {
      if (rayCastIntersect(tap, vertices[j], vertices[j + 1])) {
        intersectCount++;
      }
    }

    return ((intersectCount % 2) == 1); // odd = inside, even = outside;
  }

  bool rayCastIntersect(LatLng tap, LatLng vertA, LatLng vertB) {
    double aY = vertA.latitude;
    double bY = vertB.latitude;
    double aX = vertA.longitude;
    double bX = vertB.longitude;
    double pY = tap.latitude;
    double pX = tap.longitude;

    if ((aY > pY && bY > pY) || (aY < pY && bY < pY) || (aX < pX && bX < pX)) {
      return false; // a and b can't both be above or below pt.y, and a or
      // b must be east of pt.x
    }

    double m = (aY - bY) / (aX - bX); // Rise over run
    double bee = (-aX) * m + aY; // y = mx + b
    double x = (pY - bee) / m; // algebra is neat!

    return x > pX;
  }
}
