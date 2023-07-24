import 'dart:ui';

import 'package:flutter/material.dart';

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

  String get getName => name;

  String get getDescription => description;

  String get getSubdescription => subdescription;

  double get getPrice => price;

  Image get getImage => image;
}
