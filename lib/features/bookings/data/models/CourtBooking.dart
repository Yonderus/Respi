class CourtBooking {
  final String sport;
  final String routeImg;
  final String text;
  final String price;
  final String etiqueta1;
  final String etiqueta2;
  final String location;
  final String capacity;
  final String? caracteristics1;
  final String? caracteristics2;
  final String? caracteristics3;
  final String? caracteristics4;
  final String description;

  CourtBooking({
    required this.sport,
    required this.routeImg,
    required this.text,
    required this.price,
    required this.etiqueta1,
    required this.etiqueta2,
    required this.location,
    required this.capacity,
    required this.caracteristics1,
    required this.caracteristics2,
    required this.caracteristics3,
    required this.caracteristics4,
    required this.description,
  });

  // Método para convertir de JSON a CourtBooking
  // Si algun campo no existe en el JSON, se asigna un valor por defecto de cadena vacía
  factory CourtBooking.fromJson(Map<String, dynamic> json) {
    return CourtBooking(
      sport: json['sport'] ?? '',
      routeImg: json['routeImg'] ?? '',
      text: json['text'] ?? '',
      price: json['price'] ?? '',
      etiqueta1: json['etiqueta1'] ?? '',
      etiqueta2: json['etiqueta2'] ?? '',
      location: json['location'] ?? '',
      capacity: json['capacity'] ?? '',
      caracteristics1: json['caracteristics1'] ?? '',
      caracteristics2: json['caracteristics2'] ?? '',
      caracteristics3: json['caracteristics3'] ?? '',
      caracteristics4: json['caracteristics4'] ?? '',
      description: json['description'] ?? '',
    );
  }

  // Método para convertir de CourtBooking a JSON
  Map<String, dynamic> toJson() {
    return {
      'sport': sport,
      'routeImg': routeImg,
      'text': text,
      'price': price,
      'etiqueta1': etiqueta1,
      'etiqueta2': etiqueta2,
      'location': location,
      'capacity': capacity,
      'caracteristics1': caracteristics1,
      'caracteristics2': caracteristics2,
      'caracteristics3': caracteristics3,
      'caracteristics4': caracteristics4,
      'description': description,
    };
  }
}
