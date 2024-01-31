import 'geocoded_way_point_model.dart';
import 'route_model.dart';
import 'leg_model.dart';
import 'direction_step_model.dart';
import 'dart:math' as math;

class MapDirections {
  final List<GeocodedWaypoint> geocodedWaypoints;
  final List<Route> routes;
  final String status;
  static const double _thresholdDistance = 50.0;

  MapDirections({
    required this.geocodedWaypoints,
    required this.routes,
    required this.status,
  });

  factory MapDirections.fromJson(Map<String, dynamic> json) {
    return MapDirections(
      geocodedWaypoints: List<GeocodedWaypoint>.from(
        (json['geocoded_waypoints'] as List<dynamic>? ?? []).map(
              (waypoint) => GeocodedWaypoint.fromJson(waypoint),
        ),
      ),
      routes: List<Route>.from(
        (json['routes'] as List<dynamic>? ?? []).map(
              (route) => Route.fromJson(route),
        ),
      ),
      status: json['status'] as String? ?? "", // Provide a default value for status
    );
  }

  Map<String, dynamic> getTotalDistanceAndTime() {
    double totalDistance = 0.0;
    double totalTime = 0;

    for (final Route route in routes) {
      for (final Leg leg in route.legs) {
        totalDistance += leg.distance.value.toDouble();
        totalTime += leg.duration.value;
      }
    }

    // Convert total distance to kilometers
    totalDistance = totalDistance / 1000;

    int totalTimeMinutes = (totalTime / 60).floor();
    int hours = totalTimeMinutes ~/ 60;
    int minutes = totalTimeMinutes % 60;

    String formattedTime = 'Estimated time is ';

    if (hours > 0) {
      formattedTime += '$hours hr';
      if (hours > 1) {
        formattedTime += 's';
      }
      formattedTime += ' ';
    }

    if (minutes > 0) {
      formattedTime += '$minutes min';
      if (minutes > 1) {
        formattedTime += 's';
      }
    }

    formattedTime = "$formattedTime and you will be covering a distance of $totalDistance km";

    return {
      'totalDistance': totalDistance,
      'totalTimeHours': hours,
      'totalTimeMinutes': minutes,
      'formattedTime' : formattedTime
    };
  }

  String? getInstructionForCurrentLocation(double userLatitude, double userLongitude) {
    for (final Route route in routes) {
      for (final Leg leg in route.legs) {
        for (final DirectionStep step in leg.steps) {
          // Check if the user's current coordinates are within the bounds of this step
          if (isUserInStep(userLatitude, userLongitude, step)) {
            return step.htmlInstructions;
          }
        }
      }
    }
    return null;
  }

  bool isUserInStep(double userLatitude, double userLongitude, DirectionStep step) {
    // Check if the user's coordinates are within the threshold distance of the step's start and end locations
    double startDistance = calculateDistance(userLatitude, userLongitude, step.startLocation.lat, step.startLocation.lng);
    double endDistance = calculateDistance(userLatitude, userLongitude, step.endLocation.lat, step.endLocation.lng);

    return startDistance <= _thresholdDistance || endDistance <= _thresholdDistance;
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    // Haversine formula to calculate distance between two points on the Earth
    const double earthRadius = 6371000; // in meters

    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);

    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) * math.cos(_toRadians(lat2)) * math.sin(dLon / 2) * math.sin(dLon / 2);

    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * (math.pi / 180);
  }

}
