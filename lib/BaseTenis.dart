import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:sneakers_store/Tenis.dart';

class BaseTenis {
  static List<Tenis> _tenis = [];
  

  static void criarBase() {
    _tenis.add(Tenis(
        'Ad Yeezy Boost 350 Bred',
        'Tênis Adidas',
        'O Yeezy Boost 350 Bred é um tênis perfeito \npara quem curte um estilo street',
        599.00, const AssetImage('assets/imgs/ad_yeezy_boost350_bred.png')));
    _tenis.add(Tenis(
        'Air Force 1 Cactus Jack',
        'Tênis Nike',
        'O Air Force 1 Cactus Jack é um tênis perfeito \npara quem curte um estilo street',
        599.00, const AssetImage('assets/imgs/air_force1_cactus_jack.png')));
    _tenis.add(Tenis(
        'Air Force 1 OffWhite Black',
        'Tênis Nike',
        'O Air Force 1 OffWhite Black é um tênis perfeito \npara quem curte um estilo street',
        599.00, const AssetImage('assets/imgs/air_force1_offwhite_black.png')));
    _tenis.add(Tenis(
        'Air Force 1 OffWhite Volt',
        'Tênis Nike',
        'O Air Force 1 OffWhite Volt é um tênis perfeito \npara quem curte um estilo street',
        599.00, const AssetImage('assets/imgs/air_force1_offwhite_volt.png')));
    _tenis.add(Tenis(
        'Air Jordan 1 Bred',
        'Tênis Nike',
        'O Air Air Jordan 1 Bred é um tênis perfeito \npara quem curte um estilo street',
        599.00, const AssetImage('assets/imgs/air_jordan1_bred.png')));
    _tenis.add(Tenis(
        'Air Jordan 1 Cactus Jack',
        'Tênis Nike',
        'O Air Jordan 1 Cactus Jack é um tênis perfeito \npara quem curte um estilo street',
        599.00, const AssetImage('assets/imgs/air_jordan1_cactus_jack.png')));
    _tenis.add(Tenis(
        'Air Jordan 1 OffWhite',
        'Tênis Nike',
        'O Air Jordan 1 OffWhite é um tênis perfeito \npara quem curte um estilo street',
        599.00, const AssetImage('assets/imgs/air_jordan1_offwhite.png')));
    _tenis.add(Tenis(
        'Air Jordan 1 OffWhite Chicago',
        'Tênis Nike',
        'O Air Jordan 1 OffWhite Chicago é um tênis perfeito \npara quem curte um estilo street',
        599.00, const AssetImage('assets/imgs/air_jordan1_offwhite_chicago.png')));
    _tenis.add(Tenis(
        'Air Jordan 1 OffWhite Unc',
        'Tênis Nike',
        'O Air Jordan 1 OffWhite Unc é um tênis perfeito \npara quem curte um estilo street',
        599.00, const AssetImage('assets/imgs/air_jordan1_offwhite_unc.png')));
  }
}
