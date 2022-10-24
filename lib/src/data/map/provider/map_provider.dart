import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../../models/pickup_location_model.dart';
import 'i_map_provider.dart';

class MapProvider implements IMapProvider {
  @override
  Future<ListPickupLocationModel?> getDataFromDataJsonFile() async {
    try {
      final data = await rootBundle.loadString('assets/data.json');
      var pickupLocationModel = ListPickupLocationModel.fromJson(json.decode(data));
      return pickupLocationModel;
    } catch (e) {
      safePrint(e);
      return null;
    }
  }
}
