import 'package:flutter/material.dart';
import 'package:therapp2/services/utils/action_button/actionButton.dart';
import 'package:therapp2/services/utils/theme/Palette.dart';
import 'package:get/get.dart';

class NoteFile extends StatelessWidget {
  const NoteFile({super.key});

  @override
  Widget build(context) {
    final ActionButton actionButton = Get.put(ActionButton());
    // Access the updated count variable
    return Scaffold(
      backgroundColor: Palette.background,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Palette.textColorDark),
          onPressed: () => {}, //go back to home
        ),
        title: const Text(
          "File name", // add file name here
          style: TextStyle(
            color: Palette.textColorDark,
          ),
        ),
        backgroundColor: Palette.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.secondaryContainer),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Palette.textColorDark),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Palette.primaryContainer), // Color when pressed
                  ),
                  child: const Icon(Icons.search),
                ),
                FilledButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.secondaryContainer),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Palette.textColorDark),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Palette.primaryContainer), // Color when pressed
                  ),
                  child: const Icon(Icons.remove_red_eye_outlined),
                ),
                FilledButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.secondaryContainer),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Palette.textColorDark),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Palette.primaryContainer), // Color when pressed
                  ),
                  child: const Icon(Icons.edit_outlined),
                ),
                FilledButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.secondaryContainer),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Palette.textColorDark),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Palette.primaryContainer), // Color when pressed
                  ),
                  child: const Icon(Icons.delete),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 15, 0, 50),
              width: MediaQuery.of(context).size.width - 50,
              height: MediaQuery.of(context).size.height - 700,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Palette.cardHeader,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const TextField(
                cursorColor: Palette.primary,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Notes will go here',
                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 15,
              ),
            ),
            const SizedBox(height: 10),
            actionButton.buildActionButton(
              context: context,
              label: "Tap to Navigate",
              backgroundColor: Palette.primary,
              foregroundColor: Palette.textColorBright,
              overlayColor: Palette.primaryPressed,
            ),
          ],
        ),
      ),
    );
  }
}
