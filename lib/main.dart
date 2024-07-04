import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart';
import 'register_Hotel.dart';
import 'recently_viewed_page.dart';
import 'san_marcos_page.dart';
import 'san_pedro_page.dart';
import 'help_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
        '/registerHotel': (context) => RegisterHotel(),
        '/help': (context) => HelpPage(),
        '/sanMarcos': (context) => SanMarcosPage(),

        '/sanPedro': (context) => SanPedroPage(),
      },
    );
  }
}