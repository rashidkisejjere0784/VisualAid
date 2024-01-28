import 'direction_step.dart';

class MapDirections {
  final Map<String, dynamic> distance;
  final Map<String, dynamic> duration;
  final String endAddress;
  final Map<String, double> endLocation;
  final String startAddress;
  final Map<String, double> startLocation;
  final List<DirectionStep> steps;

  MapDirections({
    required this.distance,
    required this.duration,
    required this.endAddress,
    required this.endLocation,
    required this.startAddress,
    required this.startLocation,
    required this.steps,
  });

  factory MapDirections.fromJson(Map<String, dynamic> json) {
    return MapDirections(
      distance: json['distance'],
      duration: json['duration'],
      endAddress: json['end_address'],
      endLocation: Map<String, double>.from(json['end_location']),
      startAddress: json['start_address'],
      startLocation: Map<String, double>.from(json['start_location']),
      steps: List<DirectionStep>.from(json['steps'].map((step) => DirectionStep.fromJson(step))),
    );
  }
}
