import 'package:flutter/material.dart';

class RecentlyViewedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visto Recientemente'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('Página de Visto Recientemente'),
      ),
    );
  }
}