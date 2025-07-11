import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/tickets/ticket_list_bloc.dart';
import 'presentation/bloc/tickets/ticket_list_event.dart';
import 'presentation/screens/main_screen.dart';
import 'presentation/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ticketing System',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/main': (context) => BlocProvider(
          create: (context) => TicketListBloc()..add(const LoadTicketsEvent()),
          child: const MainScreen(),
        ),
      },
    );
  }
}
