import 'package:get/get.dart';
import 'package:therapp2/services/core/navigation/get_user_location.dart';
import 'package:therapp2/data/models/map_direction_model.dart';
import 'package:therapp2/data/providers/navigation_provider.dart';
import 'package:therapp2/services/utils/phone_direction_sensors/cardinal_direction.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:therapp2/services/utils/phone_direction_sensors/get_direction.dart';
import 'package:wakelock/wakelock.dart';

class NavigationController extends GetxController{
  final location = GetLocation();
  MapDirections? _mapDirections;

  final destination = "".obs;
  final from = "".obs;
  final isLoading = false.obs;
  final placeId = "".obs;
  final currentInstruction = ''.obs;
  final currentUserDirection = "".obs;
  final mode = 0.obs;


  void init(){
    Wakelock.enable();
    FlutterCompass.events?.listen((CompassEvent event) {
      if (event.heading != null) {
        double heading = event.heading!;
        String direction = getCardinalDirection(heading);
        currentUserDirection(direction);

      }
    });
  }

  void setMode(int mode){
    this.mode(mode);
  }

  Future getDirections() async {
    Map response = {};
    try{
      if(destination.isNotEmpty && placeId.isNotEmpty){
        var json = await getDirection(placeId.value, destination.value);

        _mapDirections = MapDirections.fromJson(json);
        response = {"Success" : "Done"};
      }
      else{
        response = {"Error" : "Missing Destination or current User Location"};
      }
    }
    catch(error){
      response = {"Error" : "$error"};
    }
    return response;
  }

  String removeHtmlTags(String htmlString) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlString.replaceAll(exp, '');
  }

  String getInstruction(double lat, double lng) {
    String instruction = '';
    final result = _mapDirections!.getInstructionForCurrentLocation(lat, lng);
    if(result == null){
      instruction = "Couldn't find any directions";
    }
    else{
      instruction = removeHtmlTags(result);
      String direction = getDirectionFromStatement(instruction);
      if(direction != "UnKnown"){
        String relativeDirection = getRelativeDirection(currentUserDirection.value, direction);

        instruction = replaceDirectionInStatement(instruction, relativeDirection);
      }

      print(instruction);
    }

    return instruction;
  }

  Map getEstimatedJourney(){
    if(_mapDirections != null){
      return _mapDirections!.getTotalDistanceAndTime();
    }
    else{
      return {
        "message" : "Error"
      };
    }
  }

  updatePlaceID(String placeId){
    print(placeId);
    this.placeId(placeId);
  }

  updateDestination(String destination){
    this.destination(destination);
  }

  updateFrom(String from){
    this.from(from);
  }

  updateIsLoading(bool isLoading){
    this.isLoading(isLoading);
  }

}