import 'package:flutter/material.dart';

Widget customIconButton(
    double width, IconData icon, String text, Color bgColor, Color fgColor, Function onClick) {
  return SizedBox(
    width: width / 1.2,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: fgColor,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(10), // Adjust the radius as needed
        ),
      ),
      onPressed: (){
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), const Spacer(), Text(text), const Spacer()],
      ),
    ),
  );
}
