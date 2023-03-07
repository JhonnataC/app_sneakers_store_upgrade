import 'package:flutter/material.dart';
import 'package:sneakers_store/HomePage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneakers Store',
      theme:  ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFFE7E9FF),
        brightness: Brightness.light,
        // primary: ,
        // secondary: ,
        ),
      ),
      home: const HomePage(),
    );
  }
}