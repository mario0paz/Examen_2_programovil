import 'package:Examen_2_programovil/screens/providercode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'providercode.dart';

class borrarticket extends StatelessWidget {
  final String id;

  borrartickets({required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<providercode>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Confirmación de Eliminación')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('¿seguro que deseas eliminar este ticket?'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await provider.deleteTicket(id);
                    Navigator.pop(context);
                    Navigator.pop(context); 
                  },
                  child: const Text('Eliminar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); 
                  },
                  child: const Text('Cancelar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
