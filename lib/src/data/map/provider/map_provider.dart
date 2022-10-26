import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';

import '../../../../models/ModelProvider.dart';
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
  Future<String?> getDirectionRouteData(
      {required LatLng yourLocation, required LatLng customerLocation}) async {
    try {
      var response = await Dio().get(
          'https://api.mapbox.com/directions/v5/mapbox/driving/${yourLocation.longitude},${yourLocation.latitude};${customerLocation.longitude},${customerLocation.latitude}?alternatives=false&geometries=geojson&overview=simplified&steps=false&access_token=pk.eyJ1IjoidGhhbmhwaGFtOTkyMCIsImEiOiJjbDlpZTFtMG8wYWl5M3NwY2dqcDZpMTBhIn0._XLejFTBa4uNScQCjJ9Dhg');
      var dataToParsed = response.data['routes'][0];
      Map<String, dynamic> dataInput = {};
      dataInput['features'] = [dataToParsed];
      return json.encode(dataInput);
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
