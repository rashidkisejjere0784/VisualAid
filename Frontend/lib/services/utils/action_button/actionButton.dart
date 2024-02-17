import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButton extends GetxController {
  Widget buildActionButton({
    required BuildContext context,
    required String label,
    required Color backgroundColor,
    required Color foregroundColor,
    required Color overlayColor,
  }) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 70, // Custom height
      child: FilledButton(
        onPressed: () => {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
          overlayColor: MaterialStateProperty.all<Color>(overlayColor),
        ),
        child: Text(label),
      ),
    );
  }
}
