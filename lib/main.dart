import 'package:flutter/material.dart';
import 'package:sneakers_store/base_dados.dart';
import 'package:sneakers_store/service/connection.dart';
import 'package:sneakers_store/views/error_page.dart';

import 'utils/list_sneakers.dart';
import 'views/home_page.dart';

void main() async {
  runApp(await Connection.conectarSGBD() ? const MyApp() : const ErrorPage());
  // ListSneakers.criarBase();
  BaseDados.createSneakersList();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData();
    return MaterialApp(
      title: 'Sneakers Store',
      theme: themeData.copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0XFFA0CCF2),
        ),
        textTheme: themeData.textTheme.copyWith(
          titleLarge: const TextStyle(
            fontFamily: 'Outfit',
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Color(0XFF03052C),
          ),
          titleMedium: const TextStyle(
            fontFamily: 'Outfit',
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color(0XFF03052C),
          ),
          titleSmall: const TextStyle(
            fontFamily: 'Outfit',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0XFF03052C),
          ),
          bodyMedium: const TextStyle(
            color: Color(0XFF03052C),
            fontFamily: 'Outfit',
            fontSize: 20,
          ),
          bodySmall: const TextStyle(
            color: Color(0XFF03052C),
            fontFamily: 'Outfit',
            fontSize: 15,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
