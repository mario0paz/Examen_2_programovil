import 'package:flutter/material.dart';
import 'package:Examen_2_programovil/crud/ticketavion.dart';
import 'package:Examen_2_programovil/model/modeloticket.dart';

class TicketProvider with ChangeNotifier {
  List<Ticket> _tickets = [];
  List<Ticket> get tickets => _tickets;

  TicketProvider() {
    fetchTickets();
  }

  Future<void> fetchTickets() async {
    leerTickets().listen((ticketList) {
      _tickets = ticketList;
      notifyListeners();
    });
  }

  Future<void> addTicket(Ticket ticket) async {
    await agregarTicket(ticket);

    _tickets.add(ticket); 
    notifyListeners();
  }

  Future<void> updateTicket(Ticket ticket) async {
    await actualizarTicket(ticket);
    
    final index = _tickets.indexWhere((t) => t.id == ticket.id);
    if (index != -1) {
      _tickets[index] = ticket;
    }
    notifyListeners();
  }

  Future<void> deleteTicket(String id) async {
    await eliminarTicket(id);
    
    _tickets.removeWhere((ticket) => ticket.id == id);
    notifyListeners();
  }
}
