import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Icon? suffixIcon;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    this.hintText = '',
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: const Color(0xFF272727).withOpacity(0.5)),
        hintText: hintText,
        fillColor: Colors.white70,
        suffixIcon: suffixIcon,
      ),
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
