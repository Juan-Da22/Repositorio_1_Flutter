import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class SlidingPanel extends StatelessWidget {
  final PanelController _panelController = PanelController();
  final VoidCallback onUpdateLocation;  // Callback para actualizar la ubicación

  SlidingPanel({super.key, required this.onUpdateLocation});

  Future<void> _getCurrentLocation(BuildContext context) async {
    try {
      onUpdateLocation();  // Llamamos al método de MapView para actualizar la ubicación

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ubicación actualizada en el mapa.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: _panelController,
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      minHeight: 80,
      maxHeight: 250,
      panel: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF706F6F).withOpacity(0.15), 
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Funciones del mapa',
              style: TextStyle(
                color: Color(0xFF706F6F), 
                fontSize: 18, 
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _getCurrentLocation(context),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color(0xFF8CBE2A), // Color del texto
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 6, // Agregar sombra para mayor profundidad
              ),
              child: const Text('Actualizar Ubicación'),
            ),
          ],
        ),
      ),
      collapsed: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF8CBE2A), // Color primario
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF706F6F).withOpacity(0.25), 
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: const Center(
          child: Text(
            "Desliza hacia arriba para ver opciones",
            style: TextStyle(
              color: Colors.white, 
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
