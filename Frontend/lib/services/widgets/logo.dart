import 'package:flutter/material.dart';
import 'package:therapp2/services/utils/theme/Palette.dart';

Widget logo(double size){
  return RichText(
    text: TextSpan(
      style: TextStyle(
          decoration: TextDecoration.none,
          fontSize: size
      ),
      children: [
        WidgetSpan(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.remove_red_eye_outlined, // Use the eye icon
              size: size + 10.0, // Adjust the size as needed
              color: Palette.primaryDark, // Replace with your desired color for the eye icon
            ),
          ),
        ),
       const TextSpan(
          text: 'Visual',
          style: TextStyle(
            // Specify the color for the word "Visual"
            color: Palette.black,
          ),
        ),
        const TextSpan(
          text: 'Ai',
          style: TextStyle(
            // Specify the color for the word "Aid"
            color: Palette.primaryDark, // Replace with your desired color for "Aid"
          ),
        ),
        const TextSpan(
          text: 'd',
          style: TextStyle(
            // Specify the color for the word "Aid"
            color: Palette.black, // Replace with your desired color for "Aid"
          ),
        ),
      ],
    ),
  );
}