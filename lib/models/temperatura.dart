class Temperatura {
  final double? tempmax;
  final double? tempmin;
  final String? description;

  const Temperatura(
      {required this.tempmax,
      required this.tempmin,
      required this.description});

  factory Temperatura.fromJson(Map<String, dynamic> json) {
    return Temperatura(
      tempmax: json['temp_max'],
      tempmin: json['temp_min'],
      description: json['description'],
    );
  }
}
