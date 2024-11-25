import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
              appBar: AppBar(
        backgroundColor: const Color(0xFF8CBE2A), // Color principal
        title: const Text(
          'ENVIASEO ESP',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
        body: const Center(
          child: Text('Sección en desarrollo, vuelva pronto ;)'),
        ),
      ),
    );
  }
}