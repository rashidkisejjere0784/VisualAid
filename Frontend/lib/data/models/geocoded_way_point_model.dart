
class GeocodedWaypoint {
  final String geocoderStatus;
  final String placeId;
  final List<String> types;

  GeocodedWaypoint({
    required this.geocoderStatus,
    required this.placeId,
    required this.types,
  });

  factory GeocodedWaypoint.fromJson(Map<String, dynamic> json) {
    return GeocodedWaypoint(
      geocoderStatus: json['geocoder_status'] as String? ?? "",
      placeId: json['place_id'] as String? ?? "",
      types: List<String>.from((json['types'] as List<dynamic>? ?? []).map<String>((e) => e as String)),
    );
  }
}

