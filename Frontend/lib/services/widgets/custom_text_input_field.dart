import 'package:flutter/material.dart';

import '../utils/theme/Palette.dart';

Widget customTextInputField(String hint, TextEditingController controller,
    double width, bool isPassword) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    width: width / 1.1,
    child: TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black), // Text color
      cursorColor: Palette.primary,

      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.grey), // Border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
              color: Palette.primaryDark), // Focused border color
        ),
        filled: true,
        fillColor: Colors.grey[200], // Background color
        contentPadding: const EdgeInsets.all(12.0),
      ),
    ),
  );
}
