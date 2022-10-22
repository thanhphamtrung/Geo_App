import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Icon? suffixIcon;
  final TextEditingController? controller;
  const AppTextField(
      {super.key, this.hintText = '', this.suffixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: const Color(0xFF272727).withOpacity(0.5)),
        hintText: hintText,
        fillColor: Colors.white70,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
