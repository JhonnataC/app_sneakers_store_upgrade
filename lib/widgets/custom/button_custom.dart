import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const ButtonCustom({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0XFF515259),
        elevation: 2,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Outfit',
          fontSize: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
