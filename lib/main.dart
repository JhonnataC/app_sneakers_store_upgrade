import 'package:flutter/material.dart';

import 'models/base_tenis.dart';
import 'views/home_page.dart';

void main() {
  BaseTenis.criarBase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneakers Store',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0XFFA0CCF2),
        ),
      ),
      home: const HomePage(),
    );
  }
}
