import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:therapp2/command.dart';
import 'package:therapp2/services/widget/substring_highlight.dart';
import 'package:therapp2/services/utils/classes_list/class_list.dart';
import 'package:therapp2/controllers/globalController.dart';
import 'package:get/get.dart';
import 'package:therapp2/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  final controller = Get.find<GlobalController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.init();

    controller.onSpeechResult = (SpeechRecognitionResult result) async {
      // Your custom implementation here
      controller.text(result.recognizedWords);

      if (!controller.speechToText.isListening){
        print("perfect");
        String predicted = controller.modelAssistant.predict(controller.text.value);
        print(predicted);
        controller.speak.say(predicted, rate: 0.4);

        if (predicted == instruction) {
          Get.offAllNamed(AppRoutes.navigation);
        }
      }
    };
  }

  @override
  void dispose() {
    print("disposed");
    super.dispose();

  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
      centerTitle: true,
      actions: [

        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.content_copy),
            onPressed: () async {
              await FlutterClipboard.copy(controller.text.value);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Copied to clipboard'),
                ),
              );
            },
          ),
        ),
      ],
    ),
    body: GestureDetector(
      onLongPress: () {
        controller.startListening();
        controller.isListening(true);
      }, //starts the recording
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(30).copyWith(bottom: 150),
          child: Column(
            children: [
              Obx(() => SubstringHighlight(
                text: controller.text.value,
                terms: Command.all,
                textStyle: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                textStyleHighlight: const TextStyle(
                  fontSize: 32.0,
                  color: Colors.red,
                  fontWeight: FontWeight.w400,
                ),
              ),
              )

            ],
          ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: Obx(() => AvatarGlow(
      animate: controller.isListening.value,
      glowColor: Theme.of(context).primaryColor,
      child: FloatingActionButton(
        onPressed: () {
          // Empty onPressed to avoid the default FloatingActionButton
        },
        shape: const CircleBorder(),
        child: Icon(controller.isListening.value ? Icons.mic : Icons.mic_none, size: 36),
      ),
    )),

  );

}
