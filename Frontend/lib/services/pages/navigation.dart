import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapp2/controllers/globalController.dart';
import 'package:therapp2/controllers/navigation_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final controller = Get.find<GlobalController>();

  @override
  void initState() {
    super.initState();
    controller.init();

    controller.onSpeechResult = (SpeechRecognitionResult result) async {
      // Your custom implementation here
      controller.text(result.recognizedWords);

      if (!controller.speechToText.isListening){
        print("perfect");
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Speech Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Recognized words:',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(16),
                    child: Obx(
                      () => Text(
                        // If listening is active show the recognized words
                        controller.isListening.value
                            ? controller.text.value
                            // If listening isn't active but could be tell the user
                            // how to start it, otherwise indicate that speech
                            // recognition is not yet ready or not supported on
                            // the target device
                            : controller.isInitialized.value
                                ? 'Tap the microphone to start listening...'
                                : 'Speech not available',
                      ),
                    )),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => AvatarGlow(
        animate: controller.speechToText.isListening,
        glowColor: Theme.of(context).primaryColor,
        child: FloatingActionButton(
          onPressed: () {
            // Empty onPressed to avoid the default FloatingActionButton
            if (!controller.isListening.value) {
              controller.startListening();
              controller.isListening(true);
            } else {
              controller.stopListening();
              controller.isListening(false);
            }
          },
          shape: const CircleBorder(),
          child: Icon(
            controller.speechToText.isListening ? Icons.mic_none : Icons.mic,
            size: 36,
          ),
        ),
      )),
    );
  }
}
