import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Examen_2_programovil/screens/borrartickets.dart';
import 'package:Examen_2_programovil/screens/detallestickets.dart';
import 'package:Examen_2_programovil/screens/editartickets.dart';
import 'package:Examen_2_programovil/screens/listadtickets.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
        path: '/', 
        builder: (BuildContext context, GoRouterState state) {
          return TicketListScreen(); 
        },
        routes: [
          GoRoute(
            name: "detallestickets",
            path: 'detail/:id',
            builder: (BuildContext context, GoRouterState state) {
              final String ticketId = state.params['id']!;
              return TicketDetailScreen(id: ticketId); 
            },
          ),
          GoRoute(
            name: "editartickets",
            path: 'edit/:id',
            builder: (BuildContext context, GoRouterState state) {
              final String ticketId = state.params['id']!;
              return TicketEditScreen(id: ticketId); 
            },
          ),
          GoRoute(
            name: "borrartickets",
            path: 'delete/:id',
            builder: (BuildContext context, GoRouterState state) {
              final String ticketId = state.params['id']!;
              return TicketDeleteScreen(id: ticketId); 
            },
          ),
        ]),
  ],
);
