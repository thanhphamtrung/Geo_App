import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfileScreen extends GetView {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('this is profile')),
    );
  }
}
