import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  String? id;  
  String numeroVuelo;
  String aerolinea;
  String pasajero;
  String origen;
  String destino;
  String asiento;
  String clase;

  Ticket({
    this.id,  
    required this.numeroVuelo,
    required this.aerolinea,
    required this.pasajero,
    required this.origen,
    required this.destino,
    required this.asiento,
    required this.clase,
  });

  
  factory Ticket.fromDocument(DocumentSnapshot doc) {
    try {
      return Ticket(
        id: doc.id,
        numeroVuelo: doc['numeroVuelo'],
        aerolinea: doc['aerolinea'],
        pasajero: doc['pasajero'],
        origen: doc['origen'],
        destino: doc['destino'],
        asiento: doc['asiento'],
        clase: doc['clase'],
      );
    } catch (e) {
      print('Error al convertir el documento a Ticket: $e');
      rethrow;  
    }
  }

  
  Map<String, dynamic> toMap() {
    return {
      'numeroVuelo': numeroVuelo,
      'aerolinea': aerolinea,
      'pasajero': pasajero,
      'origen': origen,
      'destino': destino,
      'asiento': asiento,
      'clase': clase,
    };
  }
}
