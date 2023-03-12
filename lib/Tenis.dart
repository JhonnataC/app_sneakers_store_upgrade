import 'dart:ui';

import 'package:flutter/material.dart';

class Tenis {
  late String _name;
  late String _description;
  late String _subdescription;
  late double _price;
  late Image _image;

  Tenis(this._name, this._description, this._subdescription, this._price,
      this._image);

  String get getName => _name;

  String get getDescription => _description;

  String get getSubdescription => _subdescription;

  double get getPrice => _price;

  Image get getImage => _image;
}

