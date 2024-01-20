import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:therapp2/utils/ml_model/model_dependencies.dart';
import 'package:therapp2/utils/ml_model/model_responses.dart';
import 'dart:math';

class ModelAssistant{
  late Interpreter interpreter;
  var input = [[]];
  Random _random = Random();

  ModelAssistant(){
    _initModel();
  }

  void _initModel() async{
    interpreter = await Interpreter.fromAsset('assets/ml_model/model.tflite');
  }

  void _generateInput(String text){
    text = text.toLowerCase();
    text = text.replaceAll(RegExp(r"[!#$%&'()*+,-./:;<=>?@[]^_`{|}~]"), "");
    var tokens = text.split(" ");
    var input = [];

    for (String word in vocabulary){
      if(tokens.contains(word)){
        input.add(1);
      }
      else{
        input.add(0);
      }
    }

    this.input = [input];

  }

  String predict(String text){
    _generateInput(text);

    List output = List.filled(classes.length, 0).reshape([1, classes.length]);
    interpreter.run(input, output);

    int index = _getMaxIndex(output);

    if(classes[index] == 'Irrelevant'){
      return responsesIrrelevant[_random.nextInt(responsesIrrelevant.length)];
    }

    var predClass = classes[index];
    return "This is predicted to be $predClass";
  }

  int _getMaxIndex(List elements){
    var array = elements[0];
    print(array);
    double max = 0;
    int maxIndex = -1;

    for (int i = 0; i < array.length; i++){
      var value = array[i];
      if(value > max){
        max = value;
        maxIndex = i;
      }
    }

    return maxIndex;
  }

}
