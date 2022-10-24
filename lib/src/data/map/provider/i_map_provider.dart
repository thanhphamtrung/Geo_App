import '../../models/pickup_location_model.dart';

abstract class IMapProvider {
  Future<ListPickupLocationModel?> getDataFromDataJsonFile();
}
