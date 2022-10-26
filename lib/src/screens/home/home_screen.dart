import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../controllers/home_controllers/map_app_controller.dart';

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
        title: const Text('Flutter MapBox'),
        actions: [
          IconButton(
              onPressed: () {
                // controller
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
                  -37.887305,
                  145.07845,
                ),
                zoom: 10,
              ),
              children: [
                TileLayer(
                    urlTemplate:
                        'https://api.mapbox.com/styles/v1/thanhpham9920/cl9kz1pla006i14msdd87tqlq/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidGhhbmhwaGFtOTkyMCIsImEiOiJjbDlpZTFtMG8wYWl5M3NwY2dqcDZpMTBhIn0._XLejFTBa4uNScQCjJ9Dhg',
                    additionalOptions: const {
                      'accessToken':
                          'pk.eyJ1IjoidGhhbmhwaGFtOTkyMCIsImEiOiJjbDlpZTFtMG8wYWl5M3NwY2dqcDZpMTBhIn0._XLejFTBa4uNScQCjJ9Dhg',
                      'id': 'mapbox.mapbox-streets-v8'
                    }),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: controller.map.value.yourLocation!,
                      builder: (context) => const Icon(Icons.circle),
                    ),
                    Marker(
                      point: controller.map.value.customerLocation!,
                      builder: (context) => const Icon(Icons.place),
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
