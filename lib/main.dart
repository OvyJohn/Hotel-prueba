import 'package:flutter/material.dart';
import 'package:hoteles/help_page.dart';
import 'package:hoteles/login_page.dart';
import 'package:hoteles/recently_viewed_page.dart';
import 'package:hoteles/san_marcos_page.dart';
import 'package:hoteles/san_pedro_page.dart';
import 'home_page.dart';

void main() {
  runApp(DBHApp());
}

class DBHApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DBH - Encuentra tu Hotel',
      theme: ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/recentlyViewed': (context) => RecentlyViewedPage(),
        '/login': (context) => LoginPage(),
        '/help': (context) => HelpPage(),
        '/sanMarcos': (context) => SanMarcosPage(),
        '/sanPedro': (context) => SanPedroPage(),
      },
    );
  }
}
