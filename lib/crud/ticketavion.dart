import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:Examen_2_programovil/modelos/modeloticket.dart';


Future<void> agregarTicket(Ticket ticket) async {
  try {
    await FirebaseFirestore.instance.collection('TicketAvion').add(ticket.toMap());
    print('Ticket agregado exitosamente');
  } catch (e) {
    print('Error al agregar el ticket: $e');
  }
}


Stream<List<Ticket>> leerTickets() {
  return FirebaseFirestore.instance
      .collection('TicketAvion')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Ticket.fromDocument(doc))
          .toList());
}


Future<void> actualizarTicket(Ticket ticket) async {
  try {
    await FirebaseFirestore.instance
        .collection('TicketAvion')
        .doc(ticket.id)
        .update(ticket.toMap());
    print('Ticket actualizado exitosamente');
  } catch (e) {
    print('Error al actualizar el ticket: $e');
  }
}


Future<void> eliminarTicket(String id) async {
  try {
    await FirebaseFirestore.instance.collection('TicketAvion').doc(id).delete();
    print('Ticket eliminado exitosamente');
  } catch (e) {
    print('Error al eliminar el ticket: $e');
  }
}
