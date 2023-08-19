import 'dart:typed_data';

import 'package:postgres/postgres.dart';

class Sneaker {
  String name;
  String description;
  String subdescription;
  double price;
  String image;
  int quantity;

  Sneaker(
    this.name,
    this.description,
    this.subdescription,
    this.price,
    this.image,
    this.quantity,
  );

  Sneaker.named({
    required this.name,
    required this.description,
    required this.subdescription,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory Sneaker.fromMap(PostgreSQLResult sneakerMap) {
    final tenis = sneakerMap.first.first;
    return Sneaker.named(
      name: tenis['nome'],
      description: tenis['descricao'],
      subdescription: tenis['subdescricao'],
      price: tenis['preco'],
      image: tenis['imagem'],
      quantity: tenis['quantidade'],
    );
  }

  String get getName => name;

  String get getDescription => description;

  String get getSubdescription => subdescription;

  double get getPrice => price;

  String get getImage => image;

  int get getAmount => quantity;
}
