
import 'bound_model.dart';
import 'leg_model.dart';
import 'overview_polyline.dart';

class Route {
  final Bounds bounds;
  final String copyrights;
  final List<Leg> legs;
  final OverviewPolyline overviewPolyline;
  final String summary;
  final List<String> warnings;
  final List<int> waypointOrder;

  Route({
    required this.bounds,
    required this.copyrights,
    required this.legs,
    required this.overviewPolyline,
    required this.summary,
    required this.warnings,
    required this.waypointOrder,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    return Route(
      bounds: Bounds.fromJson(json['bounds'] as Map<String, dynamic>? ?? {}),
      copyrights: json['copyrights'] as String? ?? "",
      legs: List<Leg>.from(
        (json['legs'] as List<dynamic>? ?? []).map(
              (leg) => Leg.fromJson(leg),
        ),
      ),
      overviewPolyline: OverviewPolyline.fromJson(json['overview_polyline'] as Map<String, dynamic>? ?? {}),
      summary: json['summary'] as String? ?? "",
      warnings: List<String>.from((json['warnings'] as List<dynamic>? ?? []).map<String>((e) => e as String)),
      waypointOrder: List<int>.from((json['waypoint_order'] as List<dynamic>? ?? []).map<int>((e) => e as int)),
    );
  }
}

