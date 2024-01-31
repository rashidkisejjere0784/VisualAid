
import 'distance_model.dart';
import 'duration.dart';
import 'latlng_model.dart';

class DirectionStep {
  final Distance distance;
  final Duration duration;
  final LatLng endLocation;
  final String htmlInstructions;
  final LatLng startLocation;
  final String travelMode;

  DirectionStep({
    required this.distance,
    required this.duration,
    required this.endLocation,
    required this.htmlInstructions,
    required this.startLocation,
    required this.travelMode,
  });

  factory DirectionStep.fromJson(Map<String, dynamic> json) {
    return DirectionStep(
      distance: Distance.fromJson(json['distance'] as Map<String, dynamic>? ?? {}),
      duration: Duration.fromJson(json['duration'] as Map<String, dynamic>? ?? {}),
      endLocation: LatLng.fromJson(json['end_location'] as Map<String, dynamic>? ?? {}),
      htmlInstructions: json['html_instructions'] as String? ?? "",
      startLocation: LatLng.fromJson(json['start_location'] as Map<String, dynamic>? ?? {}),
      travelMode: json['travel_mode'] as String? ?? "",
    );
  }
}
