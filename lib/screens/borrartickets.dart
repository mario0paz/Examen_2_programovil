import 'package:Examen_2_programovil/screens/providercode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'providercode.dart';

class borrartickets extends StatelessWidget {
  final String id;

  const orrartickets({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<providercode>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.deepOrangeAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Card(
              color: Colors.white,
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '¿deseas eliminar este ticket?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            await provider.deleteTicket(id);
                            GoRouter.of(context).go('/');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: const Text('Eliminar'),
                        ),
                        TextButton(
                          onPressed: () {
                            GoRouter.of(context).go('/');
                          },
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                          ),
                          child: const Text('Cancelar'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
