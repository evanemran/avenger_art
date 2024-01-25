import 'package:avenger_art/screens/detail_screen.dart';
import 'package:avenger_art/screens/home_screen.dart';
import 'package:avenger_art/screens/settings_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => const DetailScreen(),
        '/setting': (context) => const SettingsScreen(),
      },
    );
  }
}
