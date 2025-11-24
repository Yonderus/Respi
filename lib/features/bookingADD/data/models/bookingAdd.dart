// ignore_for_file: file_names

class BookingAdd {
  final String sport;
  final String day;
  final String timeIni;
  final String timeFin;
  final String location;
  final int numberOfPlayers;
  final bool isPrivate;
  final String userEmail;

  BookingAdd({
    required this.sport,
    required this.day,
    required this.timeIni,
    required this.timeFin,
    required this.location,
    required this.numberOfPlayers,
    required this.isPrivate,
    required this.userEmail,
  });

  factory BookingAdd.fromJson(Map<String, dynamic> json) {
    return BookingAdd(
      sport: json['sport'] ?? '',
      day: json['day'] ?? '',
      timeIni: json['timeIni'] ?? '',
      timeFin: json['timeFin'] ?? '',
      location: json['location'] ?? '',
      numberOfPlayers: json['numberOfPlayers'] ?? 0,
      isPrivate: json['isPrivate'] ?? false,
      userEmail: json['userEmail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sport': sport,
      'day': day,
      'timeIni': timeIni,
      'timeFin': timeFin,
      'location': location,
      'numberOfPlayers': numberOfPlayers,
      'isPrivate': isPrivate,
      'userEmail': userEmail,
    };
  }
}
