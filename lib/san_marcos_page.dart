import 'package:flutter/material.dart';

class SanMarcosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoteles en San Marcos'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Página de Hoteles en San Marcos'),
      ),
    );
  }
}