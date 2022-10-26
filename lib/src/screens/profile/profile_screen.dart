import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controllers/map_app_controller.dart';
import '../../cores/routes/app_pages.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/rounded_button.dart';

class ProfileScreen extends GetView<MapAppController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 46),
              Center(
                child: RoundedButton(
                  onPressed: () async {
                    await controller.updateDirectionRoute(
                        customerLocation:
                            controller.map.value.customerLocation!,
                        yourLocation: controller.map.value.yourLocation!);
                    controller.checkIfInsidePickupLocation();
                    Get.toNamed(Routes.home);
                  },
                  child: const Text('Draw Destination'),
                ),
              ),
              const SizedBox(height: 32),
              AppTextField(
                hintText: 'Enter Lat',
                onChanged: (value) {
                  controller.map.update((map) {
                    map?.customerLocation?.latitude =
                        double.tryParse(value ?? '') ?? 0;
                  });
                },
              ),
              const SizedBox(height: 16),
              AppTextField(
                hintText: 'Enter Long',
                onChanged: (value) {
                  controller.map.update((map) {
                    map?.customerLocation?.longitude =
                        double.tryParse(value ?? '') ?? 0;
                  });
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: RoundedButton(
                  onPressed: () async {
                    controller.saveCustomerLocation();
                  },
                  isLarge: true,
                  child: const Text('Save Location'),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: RoundedButton(
                  onPressed: () async {
                    controller.saveCustomerCurrentLocation();
                  },
                  isLarge: true,
                  child: const Text('Save Current Location'),
                ),
              ),
              // const SizedBox(height: 32),
              // Center(
              //   child: RoundedButton(
              //     onPressed: () async {
              //       controller.readCustomerLocations();
              //     },
              //     isLarge: true,
              //     child: const Text('Read Location'),
              //   ),
              // ),
              // const SizedBox(height: 32),
              // Center(
              //   child: RoundedButton(
              //     onPressed: () async {
              //       controller.readCustomerLocations();
              //     },
              //     isLarge: true,
              //     child: const Text('Read Location'),
              //   ),
              // ),
              const SizedBox(height: 46),
            ],
          ),
        ),
      ),
    );
  }
}
