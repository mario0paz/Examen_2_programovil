import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TicketAvion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildButton(
              context,
              icon: Icons.visibility,
              label: 'Ver Vuelos',
              routeName: 'Vervuelos',
            ),
            _buildButton(
              context,
              icon: Icons.edit,
              label: 'Editar Vuelos',
              routeName: 'Editatvuelos',
            ),
            _buildButton(
              context,
              icon: Icons.add_task,
              label: 'Agregar Vuelos',
              routeName: 'Agregarvuelos',
            ),
            _buildButton(
              context,
              icon: Icons.delete,
              label: 'Eliminar Vuelos',
              routeName: 'Eliminarvuelos',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required IconData icon, required String label, required String routeName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextButton.icon(
        icon: Icon(icon, size: 80),
        onPressed: () {
          context.goNamed(routeName);
        },
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
