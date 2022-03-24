class Temperatura {
  final double? tempmax;

  const Temperatura({required this.tempmax});

  factory Temperatura.fromJson(Map<String, dynamic> json) {
    return Temperatura(
      tempmax: json['temp_max'],
    );
  }
}
