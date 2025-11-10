class CourtJoin {
  final String text;
  final double pricePerson;
  final String routeImage;
  final int personasNecesarias;
  final String level;

  CourtJoin({
    required this.text,
    required this.pricePerson,
    required this.routeImage,
    required this.personasNecesarias,
    required this.level,
  });

  factory CourtJoin.fromJson(Map<String, dynamic> json) {
    return CourtJoin(
      text: json['text'] ?? '',
      pricePerson: (json['pricePerson'] ?? 0).toDouble(),
      routeImage: json['routeImage'] ?? '',
      personasNecesarias: (json['personasNecesarias'] ?? 0).toInt(),
      level: json['level'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'pricePerson': pricePerson,
      'routeImage': routeImage,
      'personasNecesarias': personasNecesarias,
      'level': level,
    };
  }
}
