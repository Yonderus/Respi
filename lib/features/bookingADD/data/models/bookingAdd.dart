// ignore_for_file: file_names

class BookingAdd {
  static int _idCounter = 0;
  static int _nextId() => ++_idCounter;

  final int id; // ID único
  final String sport;
  final String day;
  final String timeIni;
  final String timeFin;
  final String location;
  final int numberOfPlayers;
  final bool isPrivate;
  final String userEmail;

  BookingAdd({
    int? id,
    required this.sport,
    required this.day,
    required this.timeIni,
    required this.timeFin,
    required this.location,
    required this.numberOfPlayers,
    required this.isPrivate,
    required this.userEmail,
  }) : id = id ?? _nextId();

  factory BookingAdd.fromJson(Map<String, dynamic> json) {
    return BookingAdd(
      id: json['id'], // si viene del backend
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
      'id': id,
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
