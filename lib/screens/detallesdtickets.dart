import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Examen_2_programovil/screens/providercode.dart';
import 'package:go_router/go_router.dart';
import 'providercode.dart';

class detallesdtickets extends StatelessWidget {
  final String id;

  const detallesdtickets({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = provider.of<providercode>(context);

    final ticket = provider.tickets.firstWhere(
      (t) => t.id == id,
      orElse: () => null,
    );

    if (ticket == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('detalle de Ticket')),
        body: Center(
          child: Text('Ticket no encontrado'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('detalle de Ticket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Número de vuelo: ${ticket.numeroVuelo}'),
            Text('Aerolínea: ${ticket.aerolinea}'),
            Text('Pasajero: ${ticket.pasajero}'),
            Text('Origen: ${ticket.origen}'),
            Text('Destino: ${ticket.destino}'),
            Text('Asiento: ${ticket.asiento}'),
            Text('Clase: ${ticket.clase}'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/edit/${ticket.id}');
                  },
                  child: const Text('Editar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/delete/${ticket.id}');
                  },
                  child: const Text('Eliminar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
