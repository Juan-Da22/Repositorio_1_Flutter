import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart'; // Importar la librería

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Método para cambiar de página
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navegar usando rutas nombradas
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/reports');
        break;
      case 2:
        Navigator.pushNamed(context, '/map');
        break;
      case 3:
        Navigator.pushNamed(context, '/support');
        break;
      case 4:
        Navigator.pushNamed(context, '/account');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Fondo gris claro
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            // Saludo al usuario
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hola!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF706F6F).withOpacity(0.8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Noticias y temas de interés',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF706F6F),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Carrusel de noticias/intereses utilizando carousel_slider
            SizedBox(
              height: 180,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 180,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true, // Para que se desplace automáticamente
                  autoPlayInterval:
                      const Duration(seconds: 3), // Intervalo entre cada imagen
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  scrollPhysics: const BouncingScrollPhysics(),
                ),
                items: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text('Noticia 1')),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text('Noticia 2')),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(child: Text('Noticia 3')),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Título de sección
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Páginas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF706F6F),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Botones de servicios/páginas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ServiceButton(
                    icon: Icons.map,
                    label: 'Mapa',
                    onPressed: () => Navigator.pushNamed(context, '/map'),
                  ),
                  ServiceButton(
                    icon: Icons.bar_chart,
                    label: 'Estadísticas',
                    onPressed: () => Navigator.pushNamed(context, '/reports'),
                  ),
                  ServiceButton(
                    icon: Icons.report,
                    label: 'Reportes',
                    onPressed: () => Navigator.pushNamed(context, '/reports'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Botón de Servicio al Usuario
            ServiceButton(
              icon: Icons.support_agent,
              label: 'Servicio al Usuario',
              onPressed: () => Navigator.pushNamed(context, '/support'),
              isWide: true,
            ),
          ],
        ),
      ),
      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: 'Página principal'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Reportes'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.headset_mic), label: 'Soporte'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Cuenta'),
        ],
        selectedItemColor: const Color(0xFF8CBE2A), // Color principal
        unselectedItemColor:
            const Color(0xFF706F6F).withOpacity(0.5), // Gris con opacidad
        backgroundColor: const Color(0xFFF5F5F5), // Fondo gris claro
      ),
    );
  }
}

// Widget personalizado para los botones de servicio
class ServiceButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isWide;

  const ServiceButton({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isWide = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor:
                const Color(0xFFFFFFFF), // Fondo blanco para los botones
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Color(0xFF8CBE2A)), // Borde verde
            ),
            padding: isWide
                ? const EdgeInsets.symmetric(horizontal: 24, vertical: 18)
                : const EdgeInsets.all(20),
            elevation: 5, // Añadir sombra para efecto de profundidad
          ),
          child: Icon(icon,
              color: const Color(0xFF8CBE2A), size: 36), // Icono verde
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: const Color(0xFF706F6F).withOpacity(0.8), // Gris suave
          ),
        ),
      ],
    );
  }
}
