import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';

import '../../../../models/ModelProvider.dart';
import '../../../app_configs/api_configs.dart';
import '../../models/pickup_location_model.dart';
import 'i_map_provider.dart';

class MapProvider implements IMapProvider {
  @override
  Future<ListPickupLocationModel?> getDataFromDataJsonFile() async {
    try {
      final data = await rootBundle.loadString('assets/data.json');
      var pickupLocationModel =
          ListPickupLocationModel.fromJson(json.decode(data));
      return pickupLocationModel;
    } catch (e) {
      safePrint(e);
      return null;
    }
  }

  @override
  Future<bool> saveLocation(LatLng latLng) async {
    try {
      final newLocation =
          UserLocation(latitude: latLng.latitude, longitude: latLng.longitude);
      await Amplify.DataStore.save(newLocation);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>?> getDirectionRouteData(
      {required LatLng yourLocation, required LatLng customerLocation}) async {
    try {
      var response = await Dio().get(
          '${ApiConfigs.mapBoxDestinationUrl}${yourLocation.longitude},${yourLocation.latitude};${customerLocation.longitude},${customerLocation.latitude}${ApiConfigs.mapBoxDestinationQueries}${ApiConfigs.mapBoxDestinationTokenKey}${ApiConfigs.mapBoxDestinationToken}');
      return response.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<bool> updateLocation(String id, LatLng latLng) async {
    try {
      final userLocationWithId = await Amplify.DataStore.query(
        UserLocation.classType,
        where: UserLocation.ID.eq(id),
      );

      final oldLocation = userLocationWithId.first;
      final newPost = oldLocation.copyWith(
          id: oldLocation.id,
          longitude: latLng.longitude,
          latitude: latLng.latitude);

      await Amplify.DataStore.save(newPost);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<bool> readLocationsFromDatabase() async {
    try {
      final userlocation =
          await Amplify.DataStore.query(UserLocation.classType);
      print('Posts: ${userlocation.reversed}');
      return true;
    } on DataStoreException catch (e) {
      print('Query failed: $e');
      return false;
    }
  }
}
