import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sneakers_store/service/base_dados.dart';
import 'package:sneakers_store/service/connection.dart';

import '../models/sneaker.dart';

class ListSneakers {
  static final List<Sneaker> sneakers = [];

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
    sneakers.add(Sneaker(
      'Yeezy Boost',
      'Adidas sneakers',
      'The Yeezy Boost is the perfect sneaker for those who enjoy street style',
      599.00,
      imageYeezy,
      10,
    ));
    sneakers.add(Sneaker(
      'Air Force Cactus Jack',
      'Nike sneakers',
      'The Air Force Cactus Jack is the perfect shoe for those who enjoy street style',
      649.00,
      imageCactus,
      10,
    ));
    sneakers.add(Sneaker(
      'Air Force OffWhite Black',
      'Nike sneakers',
      'The Air Force OffWhite Black is the perfect sneaker for those who enjoy street style',
      700.00,
      imageBlack,
      10,
    ));
    sneakers.add(Sneaker(
      'Air Force OffWhite Volt',
      'Nike sneakers',
      'The Air Force OffWhite Volt is a perfect sneaker for those who enjoy street style',
      649.00,
      imageVolt,
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan Bred',
      'Nike sneakers',
      'The Air Jordan Bred is the perfect sneaker for those who enjoy street style',
      999.00,
      imageBred,
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan Cactus Jack',
      'Nike sneakers',
      'The Air Jordan Cactus Jack is the perfect sneaker for those who enjoy street style',
      1100.00,
      imageJack,
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan OffWhite',
      'Nike sneakers',
      'The Air Jordan OffWhite is a perfect sneaker for those who enjoy street style',
      899.00,
      imageOffwhite,
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan OffWhite Chic',
      'Nike sneakers',
      'The Air Jordan OffWhite Chicago is a perfect sneaker for those who enjoy street style',
      1050.00,
      imageChicago,
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan OffWhite Unc',
      'Nike sneakers',
      'The Air Jordan OffWhite Unc is a perfect sneaker for those who enjoy street style',
      349.00,
      imageUnc,
      10,
    ));
  }

  static Sneaker getSneakers(int index) => sneakers[index];

  static int lengthBase() => sneakers.length;
}

void _addAllSneakers() {
  var listSneakers = ListSneakers.sneakers;
  for (var sneaker in listSneakers) {
    Connection.connection.query(
        'INSERT INTO tenis(nome, descricao, subdescricao, preco, imagem, quantidade) VALUES (@nome, @descricao, @subdescricao, @preco, @imagem, @quantidade)',
        substitutionValues: {
          'nome': sneaker.getName,
          'descricao': sneaker.getDescription,
          'subdescricao': sneaker.getSubdescription,
          'preco': sneaker.getPrice,
          // 'imagem': imageToBytea(sneaker.getImage),
          'quantidade': sneaker.getAmount,
        });
  }
}

// Função para converter uma imagem PNG para bytea
// Future<Uint8List> imageToBytea(Image image) async {
//   final imageByteData = await image.toByteData(format: ImageByteFormat.png);
//   final byteList = imageByteData.buffer.asUint8List();
//   return byteList;
// }

// Função para converter bytea para imagem PNG
Future<void> byteaToPng(List<int> byteaData, String outputPath) async {
  final outputFile = File(outputPath);
  await outputFile.writeAsBytes(byteaData);
}
