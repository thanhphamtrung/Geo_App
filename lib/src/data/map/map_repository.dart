import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:geojson/geojson.dart';
import 'dart:convert';

import '../../domains/adapters/map_repo_adapter.dart';
import 'provider/i_map_provider.dart';

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
}
