class CourtBooking {
  final String sport;
  final String routeImg;
  final String text;
  final String price;
  final String etiqueta1;
  final String etiqueta2;

  CourtBooking({
    required this.sport,
    required this.routeImg,
    required this.text,
    required this.price,
    required this.etiqueta1,
    required this.etiqueta2,
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
    };
  }
}
