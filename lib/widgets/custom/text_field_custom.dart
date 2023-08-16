import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffix;
  final String? Function(String? text)? validator;
  final void Function(String text)? onChanged;

  const TextFieldCustom({
    super.key,
    required this.label,
    required this.controller,
    this.suffix,
    this.validator,
    this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0XFF515259)),
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
