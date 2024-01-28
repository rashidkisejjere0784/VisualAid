
class DirectionStep {
  final Map<String, dynamic> distance;
  final Map<String, dynamic> duration;
  final Map<String, double> endLocation;
  final String htmlInstructions;
  final Map<String, double> startLocation;
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
      distance: json['distance'],
      duration: json['duration'],
      endLocation: Map<String, double>.from(json['end_location']),
      htmlInstructions: json['html_instructions'],
      startLocation: Map<String, double>.from(json['start_location']),
      travelMode: json['travel_mode'],
    );
  }
}
