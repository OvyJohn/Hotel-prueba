import 'package:flutter/material.dart';

class SanPedroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hoteles en San Pedro'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Página de Hoteles en San Pedro'),
      ),
    );
  }
}