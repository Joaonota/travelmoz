class Temperatura {
  final double? tempmax;
  final double? tempmin;

  const Temperatura({
    required this.tempmax,
    required this.tempmin,
  });

  factory Temperatura.fromJson(Map<String, dynamic> json) {
    return Temperatura(
      tempmax: json['temp_max'],
      tempmin: json['temp_min'],
    );
  }
}
