import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controllers/profile_controller.dart';
import '../../cores/constants/app_assets.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/rounded_button.dart';

class ProfileScreen extends GetView<ProfileController> {
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
              Expanded(
                child: Center(
                  child: SizedBox(
                      height: 187,
                      width: 180,
                      child: Image.asset(ImageAssetsPath.logo)),
                ),
              ),
              AppTextField(
                hintText: 'Enter Lat',
                onChanged: (value) {
                  controller.lat.update((lat) {
                    lat = double.tryParse(value ?? '');
                  });
                },
              ),
              const SizedBox(height: 16),
              AppTextField(
                hintText: 'Enter Long',
                onChanged: (value) {
                  controller.long.update((long) {
                    long = double.tryParse(value ?? '');
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
              const SizedBox(height: 46),
            ],
          ),
        ),
      ),
    );
  }
}
