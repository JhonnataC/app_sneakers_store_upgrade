import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class Tenis {
  String name;
  String description;
  String subdescription;
  double price;
  Image image;
  int quantidade;

  Tenis(
    this.name,
    this.description,
    this.subdescription,
    this.price,
    this.image,
    this.quantidade,
  );

  factory Tenis.fromMap(PostgreSQLResult tenisMap) {
    final tenis = tenisMap.first.first;
    return Tenis(
      tenis['nome'],
      tenis['descricao'],
      tenis['subdescricao'],
      tenis['preco'],
      tenis['imagem'], // Convertar para Image de novo
      tenis['quantidade'],
    );
  }

  String get getName => name;

  String get getDescription => description;

  String get getSubdescription => subdescription;

  double get getPrice => price;

  Image get getImage => image;
}
