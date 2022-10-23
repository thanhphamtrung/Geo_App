import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../cores/constants/app_colors.dart';

class RoundedButton extends GetView {
  final VoidCallback onPressed;
  final Widget child;
  final bool? isLarge;
  final double maxHeight;
  final bool isEnabled;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.isLarge = false,
    this.maxHeight = 48,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var enableStyle = ElevatedButton.styleFrom(
      minimumSize: isLarge == true ? Size.fromHeight(maxHeight) : null,
      backgroundColor: AppColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
    var disableStyle = ElevatedButton.styleFrom(
      minimumSize: isLarge == true ? Size.fromHeight(maxHeight) : null,
      backgroundColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
    return ElevatedButton(
      style: isEnabled ? enableStyle : disableStyle,
      onPressed: isEnabled ? onPressed : null,
      child: child,
    );
  }
}
