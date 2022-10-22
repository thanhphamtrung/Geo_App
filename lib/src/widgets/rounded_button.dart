import 'package:flutter/material.dart';

import '../cores/constants/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final bool? isLarge;
  final double maxHeight;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.isLarge = false,
    this.maxHeight = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: isLarge == true ? Size.fromHeight(maxHeight) : null,
        backgroundColor: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
