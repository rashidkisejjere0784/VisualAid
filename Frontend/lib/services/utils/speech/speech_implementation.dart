import 'package:therapp2/services/core/speech/convert_to_speech.dart';

class Speak{
  late SpeechState speech;

  Speak(){
    speech = SpeechState();
    speech.initTts();
  }

  Future<void> say(String text, {double rate = 0.5, double pitch = 1, double volume = 1})async {
    speech.newVoiceText = text;
    speech.volume = volume;
    speech.rate = rate;
    speech.pitch = pitch;
    speech.speak();
  }

  Future pause() async{
    speech.pause();
  }

  Future resume() async {
    await speech.speak();
  }

  Future stop() async {
    await speech.stop();
  }
}