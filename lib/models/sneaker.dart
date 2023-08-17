import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class Sneaker {
  String name;
  String description;
  String subdescription;
  double price;
  Image image;
  int amount;

  Sneaker(
    this.name,
    this.description,
    this.subdescription,
    this.price,
    this.image,
    this.amount,
  );

  factory Sneaker.fromMap(PostgreSQLResult tenisMap) {
    final tenis = tenisMap.first.first;
    return Sneaker(
      tenis['nome'],
      tenis['descricao'],
      tenis['subdescricao'],
      tenis['preco'],
      tenis['imagem'], // Converter para Image
      tenis['quantidade'],
    );
  }

  String get getName => name;

  String get getDescription => description;

  String get getSubdescription => subdescription;

  double get getPrice => price;

  Image get getImage => image;

  int get getAmount => amount;
}
