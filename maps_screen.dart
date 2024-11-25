import 'package:flutter/material.dart';
import '../widgets/map_view.dart';
import '../widgets/sliding_up_panel.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapViewKey = GlobalKey<MapViewState>();  // Cambiado a MapViewState

    return Scaffold(
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
      body: Stack(
        children: [
          MapView(key: mapViewKey),
          SlidingPanel(
            onUpdateLocation: () => mapViewKey.currentState?.updateLocation(),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
