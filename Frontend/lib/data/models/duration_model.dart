
class Duration {
  final String text;
  final int value;

  Duration({
    required this.text,
    required this.value,
  });

  factory Duration.fromJson(Map<String, dynamic> json) {
    return Duration(
      text: json['text'] as String? ?? "",
      value: (json['value'] as num?)?.toInt() ?? 0,
    );
  }
}
