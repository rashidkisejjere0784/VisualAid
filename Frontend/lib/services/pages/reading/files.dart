import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapp2/services/utils/action_button/actionButton.dart';
import 'package:therapp2/services/utils/theme/Palette.dart';

class Files extends StatelessWidget {

  const Files({super.key});

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
          "Files",
          style: TextStyle(
            color: Palette.textColorDark,
          ),
        ),
        backgroundColor: Palette.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilledButton.tonalIcon(
                  onPressed: () => {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.secondaryContainer),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Palette.textColorDark),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Palette.primaryContainer), // Color when pressed
                  ),
                ),
                FilledButton.tonalIcon(
                  onPressed: () => {},
                  icon: const Icon(Icons.search),
                  label: const Text('Search'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.secondaryContainer),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Palette.textColorDark),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Palette.primaryContainer), // Color when pressed
                  ),
                ),
                FilledButton.tonalIcon(
                  onPressed: () => {},
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Palette.secondaryContainer),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Palette.textColorDark),
                    overlayColor: MaterialStateProperty.all<Color>(
                        Palette.primaryContainer), // Color when pressed
                  ),
                ),
              ],
            ),
            Expanded(
              child: FileList(),
            ),
            actionButton.buildActionButton(
              context: context,
              label: "Tap to Navigate",
              backgroundColor: Palette.primary,
              foregroundColor: Palette.textColorBright,
              overlayColor: Palette.primaryDark,
            ),
          ],
        ),
      ),
    );
  }
}

class FileList extends StatelessWidget {
  final List<String> fileNames = [
    'File 1',
    'File 2',
    'File 3'
  ]; // Example list of file names

  FileList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: fileNames.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(fileNames[index]), // File name
          subtitle: const Text('Last edited at ...'), // Subtitle
          onTap: () {
            // Action when the list tile is tapped
          },
        );
      },
    );
  }
}
