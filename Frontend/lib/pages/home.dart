import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:therapp2/core/speech_to_text.dart';
import 'package:therapp2/command.dart';
import 'package:therapp2/widget/substring_highlight.dart';
import 'package:therapp2/core/ml_model_predict.dart';
import 'package:therapp2/utils/speech/speech_implementation.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  final String title;

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  String text = 'Press the button and start speaking';
  bool isListening = false;
  late ModelAssistant model;
  Speak speak = Speak();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    model = ModelAssistant();
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
              await FlutterClipboard.copy(text);

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
      onLongPress: () => toggleRecording(),
      child: Container(
        color: Colors.transparent,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          reverse: true,
          padding: const EdgeInsets.all(30).copyWith(bottom: 150),
          child: Column(
            children: [
              SubstringHighlight(
                text: text,
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

            ],
          ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: AvatarGlow(
      animate: isListening,
      glowColor: Theme.of(context).primaryColor,
      child: FloatingActionButton(
        onPressed: () {
        }, // Empty onPressed to avoid the default FloatingActionButton
        shape: const CircleBorder(),
        child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
      ),
    ),
  );

  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (text) => setState(() => this.text = text),
      onListening: (isListening) {
        setState(() => this.isListening = isListening);

        if (!isListening) {
          Future.delayed(const Duration(seconds: 1), () {
            String predicted = model.predict(text);
            speak.say(predicted, rate: 0.4);
          });
        }
      });
}
