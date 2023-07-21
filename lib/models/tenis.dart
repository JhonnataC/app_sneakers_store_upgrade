import 'dart:ui';

import 'package:flutter/material.dart';

class Tenis {
  String name;
  String description;
  String subdescription;
  double price;
  Image image;

  Tenis(
    this.name,
    this.description,
    this.subdescription,
    this.price,
    this.image,
  );

  String get getName => name;

  String get getDescription => description;

  String get getSubdescription => subdescription;

  double get getPrice => price;

  Image get getImage => image;
}
