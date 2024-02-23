import 'package:flutter/material.dart';

Widget customImageButton(
    double width,
    String imagePath, // Path to your image asset
    String text,
    Color bgColor,
    Color fgColor,
    Function onClick,
    ) {
  return SizedBox(
    width: width / 1.2,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 24, // Adjust the height of the image as needed
            width: 24, // Adjust the width of the image as needed
          ),
          const Spacer(),
          Text(text),
          const Spacer(),
        ],
      ),
    ),
  );
}
