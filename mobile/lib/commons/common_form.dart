import 'package:flutter/material.dart';

import '../utils/constants/font_app.dart';

class CommonForm extends StatelessWidget {
  final TextEditingController value;
  final String label;
  const CommonForm({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: value,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: label,
            hintStyle: const TextStyle(
                fontFamily: manrope,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5)),
        scrollPadding: const EdgeInsets.all(0),
      ),
    );
  }
}
