import 'distance_model.dart';
import 'duration_model.dart';
import 'direction_step_model.dart';
import 'latlng_model.dart';

class Leg {
  final Distance distance;
  final Duration duration;
  final String endAddress;
  final LatLng endLocation;
  final String startAddress;
  final LatLng startLocation;
  final List<DirectionStep> steps;
  final List<dynamic> trafficSpeedEntry;
  final List<dynamic> viaWaypoint;

  Leg({
    required this.distance,
    required this.duration,
    required this.endAddress,
    required this.endLocation,
    required this.startAddress,
    required this.startLocation,
    required this.steps,
    required this.trafficSpeedEntry,
    required this.viaWaypoint,
  });

  factory Leg.fromJson(Map<String, dynamic> json) {
    return Leg(
      distance: Distance.fromJson(json['distance'] as Map<String, dynamic>? ?? {}),
      duration: Duration.fromJson(json['duration'] as Map<String, dynamic>? ?? {}),
      endAddress: json['end_address'] as String? ?? "",
      endLocation: LatLng.fromJson(json['end_location'] as Map<String, dynamic>? ?? {}),
      startAddress: json['start_address'] as String? ?? "",
      startLocation: LatLng.fromJson(json['start_location'] as Map<String, dynamic>? ?? {}),
      steps: List<DirectionStep>.from(
        (json['steps'] as List<dynamic>? ?? []).map(
              (step) => DirectionStep.fromJson(step),
        ),
      ),
      trafficSpeedEntry: List<dynamic>.from(json['traffic_speed_entry'] as List<dynamic>? ?? []),
      viaWaypoint: List<dynamic>.from(json['via_waypoint'] as List<dynamic>? ?? []),
    );
  }
}

