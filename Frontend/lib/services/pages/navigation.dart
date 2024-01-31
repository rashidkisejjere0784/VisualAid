import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
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
  final navigationController = Get.find<NavigationController>();
  int mode = 0;

  @override
  void initState() {
    super.initState();
    controller.init();
    navigationController.init();

    initSpeech();
    controller.speak.say("Initializing Navigation Mode, please wait.");
    init();
    controller.speak.say(
        "Navigation Mode Initiated Successfully. Where do you want to go to ?");
    mode = 1;
  }

  void init() async {
    final address =
        await navigationController.location.getUserLocationAndPlaceId();
    print(address);
    navigationController.updatePlaceID(address['placeId']);
    navigationController.updateFrom(address['address']);

    navigationController.location.location.onLocationChanged.listen((LocationData location){
      if(mode == 5){
        var instruction = navigationController.getInstruction(location.latitude!, location.longitude!);
        if(instruction != navigationController.currentInstruction.value){
          navigationController.currentInstruction(instruction);
          controller.speak.say(instruction);
        }
      }
    });
  }

  void initSpeech() {
    controller.onSpeechResult = (SpeechRecognitionResult result) async {
      // Your custom implementation here
      controller.text(result.recognizedWords);

      if (!controller.speechToText.isListening) {
        final text = result.recognizedWords;
        print(text);
        if (mode == 1) {
          //Destination Mode
          navigationController.updateDestination(text);
          controller.speak.say(
              "Please confirm whether you want to travel to $text By replying Yes or No");
          mode = 2;
        } else if (mode == 2) {
          print("here");
          //Confimation Mode
          if (text.contains("yes")) {
            String from = navigationController.from.value;
            String to = navigationController.destination.value;
            controller.speak
                .say("Getting directions from $from to $to, please wait");

            final response = await navigationController.getDirections();
            print(response);
            final estimate = navigationController.getEstimatedJourney();
            final distance = estimate['totalDistance'];
            final journey = estimate['formattedTime'];

            controller.speak
                .say('$journey, Do you want to Start your journey ? Yes or No');
            mode = 3;
          } else if (text.contains("no")) {
            controller.speak.say(
                "Sorry for not getting that right, kindly repeat and try to be audible");
            mode = 1;
          } else {
            controller.speak.say(
                "I am unable to get what you meant there, please reply yes or no");
          }
        } else if (mode == 3) {
          final destination = navigationController.destination.value;
          if(text.contains("no")) {
            controller.speak.say(
                "Navigation to $destination cancelled, where do you want to go to instead ?");
            mode = 1;
          }
          else if(text.contains("yes")){
            controller.speak.say(
                "Navigation to $destination Has Started, Kindly listen to the instructions");
            mode = 5;
          }
          else{
            controller.speak.say(
                "I am unable to get what you meant there, please reply yes or no");
          }
        }
      }
    };
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Demo'),
      ),
      body: GestureDetector(
        onLongPress: () {
          controller.startListening();
          controller.isListening(true);
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.green,
          child: Center(
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() => AvatarGlow(
            animate: controller.speechToText.isListening,
            glowColor: Theme.of(context).primaryColor,
            child: FloatingActionButton(
              onPressed: () {
                // Empty onPressed to avoid the default FloatingActionButton
              },
              shape: const CircleBorder(),
              child: Icon(
                  controller.isListening.value ? Icons.mic : Icons.mic_none,
                  size: 36),
            ),
          )),
    );
  }
}
