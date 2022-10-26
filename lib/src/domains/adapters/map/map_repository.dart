import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:geojson/geojson.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';

import 'map_repo_adapter.dart';
import '../../../data/map/provider/i_map_provider.dart';

class MapRepository implements IMapRepository {
  final IMapProvider provider;

  MapRepository({required this.provider});

  @override
  Future<GeoJson?> getGeoData() async {
    final geo = GeoJson();
    try {
      var pickupLocationModel = await provider.getDataFromDataJsonFile();

      await geo.parse(jsonEncode(pickupLocationModel
          ?.listPickupLocationModel?.first.geoHubTileDistance));
      return geo;
    } catch (e) {
      safePrint(e);
      return null;
    }
  }

  @override
  Future<bool> saveCustomerLocation(LatLng latLng) async {
    try {
      return await provider.saveLocation(latLng);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<GeoJson?> getDirectionRoutes(
      {required LatLng yourLocation, required LatLng customerLocation}) async {
    final geo = GeoJson();
    try {
      var data = await provider.getDirectionRouteData(
          yourLocation: yourLocation, customerLocation: customerLocation);
      await geo.parse(data!);
      return geo;
    } catch (e) {
      safePrint(e);
      return null;
    }
  }

  @override
  Future<bool> updateCustomerLocation(String id, LatLng latLng) async {
    late bool result;
    try {
      result = await provider.updateLocation(id, latLng);
      return result;
    } catch (e) {
      print(e);
      return result;
    }
  }

  @override
  Future<bool> readCustomerLocations() async {
    late bool result;
    try {
      result = await provider.readLocationsFromDatabase();
      return result;
    } catch (e) {
      print(e);
      return result;
    }
  }
}
