import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/match_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resultados Uruguay',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/match-detail': (context) => const MatchDetailScreen(),
      },
    );
  }
}
