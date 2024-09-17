import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:Examen_2_programovil/router/router.dart'; 
import 'package:go_router/go_router.dart';
import 'package:Examen_2_programovil/screens/providercoder.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TicketProvider(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router, 
        title: 'TicketAvion', 
        theme: ThemeData(
          primarySwatch: Colors.blue, 
        ),
      ),
    );
  }
}
