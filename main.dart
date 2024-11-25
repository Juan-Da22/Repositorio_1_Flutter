import 'package:flutter/material.dart';
import 'package:operarios_de_barrido/screens/account_page.dart';
import 'package:operarios_de_barrido/screens/chat_page.dart';
import 'package:operarios_de_barrido/screens/login_screen.dart';
import 'package:operarios_de_barrido/screens/maps_screen.dart';
import 'package:operarios_de_barrido/screens/home_page.dart';
import 'package:operarios_de_barrido/screens/reports_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enviaseo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF8CBE2A),
          elevation: 4,
        ),
      ),
      initialRoute: '/',  // Definir la ruta inicial
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(), // Página de inicio
        '/reports': (context) => const ReportsPage(), // Página de Reportes
        '/map': (context) => const MapScreen(), // Página de Mapa
        '/support': (context) => const ChatPage(), // Página de Soporte
        '/account': (context) => const AccountPage(), // Página de Cuenta
      },
    );
  }
}