import 'package:get/get.dart';
import 'package:therapp2/services/utils/speech/speech_implementation.dart';
import 'package:therapp2/services/core/ml/ml_model_predict.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class GlobalController extends GetxController {
  final Speak speak = Speak();
  final ModelAssistant modelAssistant = ModelAssistant();
  SpeechToText speechToText = SpeechToText();
  final speechEnabled = false.obs;
  Future<void> Function(SpeechRecognitionResult)? onSpeechResult;

  final text = "Long Press on the Screen to Record".obs;
  final isListening = false.obs;
  final isInitialized = false.obs;

  void init() async {
    speechEnabled(await speechToText.initialize());
    isInitialized(true);
  }

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    isListening(true);
  }

  void stopListening() async {
    await speechToText.stop();
    isListening(false);
  }

  updateText(String text){
    this.text(text);
  }

  updateIsListening(bool isListening){
    this.isListening(isListening);
  }
}