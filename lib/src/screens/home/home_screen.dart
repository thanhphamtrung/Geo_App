import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../app_configs/api_configs.dart';
import '../../controllers/home_controllers/map_app_controller.dart';
import '../../cores/constants/string_const.dart';

class HomeScreen extends GetView<MapAppController> {
  final LatLng? yourLocation;
  final LatLng? customerLocation;
  const HomeScreen({
    super.key,
    this.yourLocation,
    this.customerLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(HomeConst.appName),
        actions: [
          Obx(() {
            if (controller.isInsidePickUpLocation.value) {
              return ElevatedButton(
                onPressed: () {},
                child: Text(HomeConst.pickupButtonLabel),
              );
            }
            return const SizedBox.shrink();
          }),
          IconButton(
              onPressed: () async {
                await controller.getEtaDistance();
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: Text(HomeConst.userInfoModelTitle),
                          content: Obx(() => SizedBox(
                                height: 120,
                                child: (Column(
                                  children: [
                                    Text(
                                        '${HomeConst.etaDescription} ${controller.map.value.eta.toString()}'),
                                    const SizedBox(height: 16),
                                    Text(
                                        '${HomeConst.distanceDescription} ${controller.map.value.distance.toString()}'),
                                  ],
                                )),
                              )),
                        ));
              },
              icon: const Icon(Icons.info)),
        ],
      ),
      body: Stack(
        children: [
          Obx(
            () => FlutterMap(
              mapController: MapController(),
              options: MapOptions(
                center: LatLng(
                  controller.map.value.customerLocation!.latitude,
                  controller.map.value.customerLocation!.longitude,
                ),
                zoom: 10,
              ),
              children: [
                TileLayer(
                    urlTemplate: ApiConfigs.mapBoxUrlTemplate,
                    additionalOptions: {
                      ApiConfigs.accessTokenKey: ApiConfigs.accessToken,
                      ApiConfigs.mapIDkey: ApiConfigs.mapID,
                    }),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: controller.map.value.yourLocation!,
                      builder: (context) => const Icon(
                        Icons.circle_outlined,
                        color: Colors.black,
                      ),
                    ),
                    Marker(
                      point: controller.map.value.customerLocation!,
                      builder: (context) => const Icon(
                        Icons.place,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                if (controller.map.value.polygons != null &&
                    controller.map.value.polygons!.isNotEmpty)
                  PolygonLayer(polygons: controller.map.value.polygons!),
                if (controller.map.value.polyLines != null &&
                    controller.map.value.polyLines!.isNotEmpty)
                  PolylineLayer(polylines: controller.map.value.polyLines!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
