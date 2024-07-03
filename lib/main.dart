import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(DBHApp());
}

class DBHApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DBH - Encuentra tu Hotel',
      theme: ThemeData(
        primaryColor:
            Colors.blue, // Color para los botones y la barra de título
        scaffoldBackgroundColor: Colors.white, // Color de fondo del scaffold
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DBH'),
        centerTitle: true,
        backgroundColor: Colors.blue, // Color del AppBar
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue, // Color del DrawerHeader
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Visto Recientemente'),
              onTap: () {
                // Acción cuando se selecciona "Visto Recientemente"
                Navigator.pop(context); // Cerrar el Drawer
                print('Visto Recientemente');
              },
            ),
            ListTile(
              title: Text('Iniciar Sesión'),
              onTap: () {
                // Acción cuando se selecciona "Iniciar Sesión"
                Navigator.pop(context); // Cerrar el Drawer
                print('Iniciar Sesión');
              },
            ),
            ListTile(
              title: Text('Ayuda'),
              onTap: () {
                // Acción cuando se selecciona "Ayuda"
                Navigator.pop(context); // Cerrar el Drawer
                print('Ayuda');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://lh6.googleusercontent.com/yLYB0Hs0bsXKfqJWqYLn-m-oNRTtv6UcHtjir82wOQaRU4CH-I98c0OgKJhPIkRRw2dJE7gZLUsLYQSRUcC1LvNJm00EqiSslATxySd7BfJ7rh76WJ342eiai-EnSaDrFw=w1280',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Center(child: Icon(Icons.error)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Encuentra el Hotel que necesitas',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white, // Asegúrate de que el texto sea legible sobre la imagen
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Encuentra el Hotel que Necesitas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .white, // Asegúrate de que el texto sea legible sobre la imagen
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón "Buscar por precio"
                    print('Buscar por precio');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue[300], // Color más claro para los botones
                  ),
                  child: const Text('Buscar por precio',
                      style: TextStyle(fontSize: 18)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Acción al presionar el botón "Buscar por departamento"
                    print('Buscar por departamento');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blue[300], // Color más claro para los botones
                  ),
                  child: Text('Buscar por departamento',
                      style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
