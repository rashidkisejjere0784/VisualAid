import 'latlng_model.dart';

class Bounds {
  final LatLng northeast;
  final LatLng southwest;

  Bounds({
    required this.northeast,
    required this.southwest,
  });

  factory Bounds.fromJson(Map<String, dynamic> json) {
    return Bounds(
      northeast: LatLng.fromJson(json['northeast'] as Map<String, dynamic>? ?? {}),
      southwest: LatLng.fromJson(json['southwest'] as Map<String, dynamic>? ?? {}),
    );
  }
}
