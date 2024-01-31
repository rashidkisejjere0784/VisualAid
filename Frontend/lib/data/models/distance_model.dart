
class Distance {
  final String text;
  final int value;

  Distance({
    required this.text,
    required this.value,
  });

  factory Distance.fromJson(Map<String, dynamic> json) {
    return Distance(
      text: json['text'] as String? ?? "",
      value: (json['value'] as num?)?.toInt() ?? 0,
    );
  }
}
