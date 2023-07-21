import 'dart:ui';
import 'package:flutter/material.dart';

import 'tenis.dart';

class BaseTenis {
  static List<Tenis> _tenis = [];

  static final Image imageYeezy =
      Image.asset('assets/imgs/ad_yeezy_boost350_bred.png');
  static final Image imageCactus =
      Image.asset('assets/imgs/air_force1_cactus_jack.png');
  static final Image imageBlack =
      Image.asset('assets/imgs/air_force1_offwhite_black.png');
  static final Image imageVolt =
      Image.asset('assets/imgs/air_force1_offwhite_volt.png');
  static final Image imageBred =
      Image.asset('assets/imgs/air_jordan1_bred.png');
  static final Image imageJack =
      Image.asset('assets/imgs/air_jordan1_cactus_jack.png');
  static final Image imageOffwhite =
      Image.asset('assets/imgs/air_jordan1_offwhite.png');
  static final Image imageChicago =
      Image.asset('assets/imgs/air_jordan1_offwhite_chicago.png');
  static final Image imageUnc =
      Image.asset('assets/imgs/air_jordan1_offwhite_unc.png');

  static void criarBase() {
    _tenis.add(Tenis(
        'Ad Yeezy Boost 350 Bred',
        'Tênis Adidas',
        'O Yeezy Boost 350 Bred é um tênis perfeito \npara quem curte um estilo street',
        599.00,
        imageYeezy));
    _tenis.add(Tenis(
        'Air Force 1 Cactus Jack',
        'Tênis Nike',
        'O Air Force 1 Cactus Jack é um tênis perfeito \npara quem curte um estilo street',
        649.00,
        imageCactus));
    _tenis.add(Tenis(
        'Air Force 1 OffWhite Black',
        'Tênis Nike',
        'O Air Force 1 OffWhite Black é um tênis perfeito \npara quem curte um estilo street',
        700.00,
        imageBlack));
    _tenis.add(Tenis(
        'Air Force 1 OffWhite Volt',
        'Tênis Nike',
        'O Air Force 1 OffWhite Volt é um tênis perfeito \npara quem curte um estilo street',
        649.00,
        imageVolt));
    _tenis.add(Tenis(
        'Air Jordan 1 Bred',
        'Tênis Nike',
        'O Air Air Jordan 1 Bred é um tênis perfeito \npara quem curte um estilo street',
        999.00,
        imageBred));
    _tenis.add(Tenis(
        'Air Jordan 1 Cactus Jack',
        'Tênis Nike',
        'O Air Jordan 1 Cactus Jack é um tênis perfeito \npara quem curte um estilo street',
        1100.00,
        imageJack));
    _tenis.add(Tenis(
        'Air Jordan 1 OffWhite',
        'Tênis Nike',
        'O Air Jordan 1 OffWhite é um tênis perfeito \npara quem curte um estilo street',
        899.00,
        imageOffwhite));
    _tenis.add(Tenis(
        'Air Jordan 1 OffWhite Chic',
        'Tênis Nike',
        'O Air Jordan 1 OffWhite Chicago é um tênis perfeito \npara quem curte um estilo street',
        1050.00,
        imageChicago));
    _tenis.add(Tenis(
        'Air Jordan 1 OffWhite Unc',
        'Tênis Nike',
        'O Air Jordan 1 OffWhite Unc é um tênis perfeito \npara quem curte um estilo street',
        349.00,
        imageUnc));
  }

  static Tenis getTenis(int index) => _tenis[index];

  static int lengthBase() => _tenis.length;
}
