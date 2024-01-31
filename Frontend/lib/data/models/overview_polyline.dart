
class OverviewPolyline {
  final String points;

  OverviewPolyline({
    required this.points,
  });

  factory OverviewPolyline.fromJson(Map<String, dynamic> json) {
    return OverviewPolyline(
      points: json['points'] as String? ?? "",
    );
  }
}
