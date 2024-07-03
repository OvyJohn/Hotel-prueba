import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Página de Ayuda'),
      ),
    );
  }
}