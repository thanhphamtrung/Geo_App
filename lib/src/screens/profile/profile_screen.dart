import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controllers/map_app_controller.dart';
import '../../cores/constants/app_assets.dart';
import '../../cores/constants/string_const.dart';
import '../../cores/routes/app_pages.dart';
import '../../widgets/rounded_button.dart';

class ProfileScreen extends GetView<MapAppController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () async {
                await controller.signOut();
                Get.toNamed(Routes.login);
              },
              child: Text(ProfileConst.logOut),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(child: Image.asset(ImageAssetsPath.logo)),
              const SizedBox(height: 32),
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
                  child: Text(ProfileConst.drawDestination),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: RoundedButton(
                  onPressed: () async {
                    controller.saveCustomerCurrentLocation();
                  },
                  isLarge: true,
                  child: Text(ProfileConst.saveCurrentLocation),
                ),
              ),
              const SizedBox(height: 46),
            ],
          ),
        ),
      ),
    );
  }
}
