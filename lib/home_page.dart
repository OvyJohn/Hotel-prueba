import 'package:flutter/material.dart';
import 'drawer_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DBH'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: DrawerWidget(), // Usa el cajón de navegación desde drawer_widget.dart
      body: Stack(
        children: [
          // Aquí iría el widget de la imagen de fondo o cualquier contenido específico de la página principal
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sanMarcos');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                  ),
                  child: const Text('Hoteles en San Marcos', style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/sanPedro');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[300],
                  ),
                  child: Text('Hoteles en San Pedro', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}