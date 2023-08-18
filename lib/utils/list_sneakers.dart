import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sneakers_store/service/connection.dart';

import '../models/sneaker.dart';

class ListSneakers {
  static final List<Sneaker> sneakers = [];

  static const String imageYeezy = 'assets/imgs/ad_yeezy_boost350_bred.png';
  static const String imageCactus = 'assets/imgs/air_force1_cactus_jack.png';
  static const String imageBlack = 'assets/imgs/air_force1_offwhite_black.png';
  static const String imageVolt = 'assets/imgs/air_force1_offwhite_volt.png';
  static const String imageBred = 'assets/imgs/air_jordan1_bred.png';
  static const String imageJack = 'assets/imgs/air_jordan1_cactus_jack.png';
  static const String imageOffwhite = 'assets/imgs/air_jordan1_offwhite.png';
  static const String imageChicago =
      'assets/imgs/air_jordan1_offwhite_chicago.png';
  static const String imageUnc = 'assets/imgs/air_jordan1_offwhite_unc.png';

  static Future<void> criarBase() async {
    sneakers.add(Sneaker(
      'Yeezy Boost',
      'Adidas sneakers',
      'The Yeezy Boost is the perfect sneaker for those who enjoy street style',
      599.00,
      await imageToUint8List(imageYeezy),
      10,
    ));
    sneakers.add(Sneaker(
      'Air Force Cactus Jack',
      'Nike sneakers',
      'The Air Force Cactus Jack is the perfect shoe for those who enjoy street style',
      649.00,
      await imageToUint8List(imageCactus),
      10,
    ));
    sneakers.add(Sneaker(
      'Air Force OffWhite Black',
      'Nike sneakers',
      'The Air Force OffWhite Black is the perfect sneaker for those who enjoy street style',
      700.00,
      await imageToUint8List(imageBlack),
      10,
    ));
    sneakers.add(Sneaker(
      'Air Force OffWhite Volt',
      'Nike sneakers',
      'The Air Force OffWhite Volt is a perfect sneaker for those who enjoy street style',
      649.00,
      await imageToUint8List(imageVolt),
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan Bred',
      'Nike sneakers',
      'The Air Jordan Bred is the perfect sneaker for those who enjoy street style',
      999.00,
      await imageToUint8List(imageBred),
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan Cactus Jack',
      'Nike sneakers',
      'The Air Jordan Cactus Jack is the perfect sneaker for those who enjoy street style',
      1100.00,
      await imageToUint8List(imageJack),
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan OffWhite',
      'Nike sneakers',
      'The Air Jordan OffWhite is a perfect sneaker for those who enjoy street style',
      899.00,
      await imageToUint8List(imageOffwhite),
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan OffWhite Chic',
      'Nike sneakers',
      'The Air Jordan OffWhite Chicago is a perfect sneaker for those who enjoy street style',
      1050.00,
      await imageToUint8List(imageChicago),
      10,
    ));
    sneakers.add(Sneaker(
      'Air Jordan OffWhite Unc',
      'Nike sneakers',
      'The Air Jordan OffWhite Unc is a perfect sneaker for those who enjoy street style',
      349.00,
      await imageToUint8List(imageUnc),
      10,
    ));
    // _addAllSneakersSgbd();
  }

  static Sneaker getSneakers(int index) => sneakers[index];

  static int lengthBase() => sneakers.length;
}

void _addAllSneakersSgbd() {
  try {
    for (var sneaker in ListSneakers.sneakers) {
      Connection.connection.query(
          'INSERT INTO tenis(nome, descricao, subdescricao, preco, imagem, quantidade) VALUES (@nome, @descricao, @subdescricao, @preco, @imagem, @quantidade)',
          substitutionValues: {
            'nome': sneaker.getName,
            'descricao': sneaker.getDescription,
            'subdescricao': sneaker.getSubdescription,
            'preco': sneaker.getPrice,
            'imagem': sneaker.getImage,
            'quantidade': sneaker.getAmount,
          });
    }
    print('tenis adicionados no bd');
  } catch (e) {
    print('Erro ao adicionar');
  }
}

// Função para converter uma imagem PNG para bytea
Future<Uint8List> imageToUint8List(String imagePath) async {
  final ByteData data = await rootBundle.load(imagePath);
  return data.buffer.asUint8List();
}

// Função para converter bytea para imagem PNG
Future<void> byteaToPng(List<int> byteaData, String outputPath) async {
  final outputFile = File(outputPath);
  await outputFile.writeAsBytes(byteaData);
}
