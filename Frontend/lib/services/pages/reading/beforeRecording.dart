import 'dart:async';
import 'package:flutter/material.dart';
import 'package:therapp2/services/utils/action_button/actionButton.dart';
import 'package:therapp2/services/utils/theme/Palette.dart';
import 'package:get/get.dart';

StreamController controller = StreamController.broadcast();

class BeforeRecording extends StatelessWidget {
  const BeforeRecording({super.key});

  @override
  Widget build(context) {
    final ActionButton actionButton = Get.put(ActionButton());

    double position;

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //     Stack(
              //       children: [
              //         Container(
              //           // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              //           width: MediaQuery.of(context).size.width - 50,
              //           height: MediaQuery.of(context).size.height - 400,
              //           padding: const EdgeInsets.all(5),
              //           decoration: BoxDecoration(
              //             color: Palette.cardHeader,
              //             borderRadius: BorderRadius.circular(15),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.black.withOpacity(0.3),
              //                 blurRadius: 3,
              //                 spreadRadius: 2,
              //               ),
              //             ],
              //           ),
              //         ),
              //         const Column(
              //           children: [
              //             Text(
              //               "Swipe up to start recording",
              //               style: TextStyle(
              //                 color: Palette.textColorDark,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 20,
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //     const SizedBox(height: 50),
              actionButton.buildActionButton(
                context: context,
                label: "Cancel",
                backgroundColor: Palette.secondaryContainer,
                foregroundColor: Palette.textColorDark,
                overlayColor: Palette.primaryContainer,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Center(
        child: StreamBuilder(
          stream: controller.stream,
          builder: (context, spanshot) => GestureDetector(
            onVerticalDragUpdate: (DragUpdateDetails details) {
              position = MediaQuery.of(context).size.height -
                  details.globalPosition.dy;
              if (!position.isNegative && position < 240) {
                controller.add(position);
              }
            },
            onVerticalDragEnd: (details) {
              controller.add(MediaQuery.of(context).size.height * 0.12);
            },
            child: SizedBox(
              height: spanshot.hasData
                  ? spanshot.data
                  : MediaQuery.of(context).size.height * 0.12,
              child: IconButton(
                icon: const Icon(Icons.arrow_circle_up),
                color: Palette.textColorDark,
                onPressed: () => {},
                iconSize: 200,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//chatGPT
class SwipeableButton extends StatefulWidget {
  const SwipeableButton({super.key});

  @override
  _SwipeableButtonState createState() => _SwipeableButtonState();
}

class _SwipeableButtonState extends State<SwipeableButton> {
  double _dy = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          _dy += details.delta.dy;
        });
      },
      onVerticalDragEnd: (_) {
        if (_dy < -10) {
          setState(() {
            _dy = 0;
          });
        }
      },
      child: Stack(
        children: [
          Positioned(
            bottom: _dy,
            left: MediaQuery.of(context).size.width / 2 - 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Swipeable Button'),
            ),
          ),
        ],
      ),
    );
  }
}
