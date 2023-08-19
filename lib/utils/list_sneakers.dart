// import 'dart:io';
// import 'package:flutter/services.dart';
// import 'package:sneakers_store/service/connection.dart';

// import '../models/sneaker.dart';

// class ListSneakers {
//   static final List<Sneaker> sneakers = [];

//   static const String _imageYeezy =
//       'https://i.ibb.co/VBR81Rk/ad-yeezy-boost350-bred.png';
//   static const String _imageCactus =
//       'https://i.ibb.co/SwF4Jmq/air-force1-cactus-jack.png';
//   static const String _imageBlack =
//       'https://i.ibb.co/GxmJNQv/air-force1-offwhite-black.png';
//   static const String _imageVolt =
//       'https://i.ibb.co/Js5LGHt/air-force1-offwhite-volt.png';
//   static const String _imageBred =
//       'https://i.ibb.co/hKbkQH1/air-jordan1-bred.png';
//   static const String _imageJack =
//       'https://i.ibb.co/hF4TdKk/air-jordan1-cactus-jack.png';
//   static const String _imageOffwhite =
//       'https://i.ibb.co/MBdhzsg/air-jordan1-offwhite.png';
//   static const String _imageChicago =
//       'https://i.ibb.co/g9HMH5Q/air-jordan1-offwhite-chicago.png';
//   static const String imageUnc =
//       'https://i.ibb.co/H2pQPh4/air-jordan1-offwhite-unc.png';

//   static Future<void> criarBase() async {
//     sneakers.add(Sneaker(
//       'Yeezy Boost',
//       'Adidas sneakers',
//       'The Yeezy Boost is the perfect sneaker for those who enjoy street style',
//       599.00,
//       _imageYeezy,
//       10,
//     ));
//     sneakers.add(Sneaker(
//       'Air Force Cactus Jack',
//       'Nike sneakers',
//       'The Air Force Cactus Jack is the perfect shoe for those who enjoy street style',
//       649.00,
//       _imageCactus,
//       10,
//     ));
//     sneakers.add(Sneaker(
//       'Air Force OffWhite Black',
//       'Nike sneakers',
//       'The Air Force OffWhite Black is the perfect sneaker for those who enjoy street style',
//       700.00,
//       _imageBlack,
//       10,
//     ));
//     sneakers.add(Sneaker(
//       'Air Force OffWhite Volt',
//       'Nike sneakers',
//       'The Air Force OffWhite Volt is a perfect sneaker for those who enjoy street style',
//       649.00,
//       _imageVolt,
//       10,
//     ));
//     sneakers.add(Sneaker(
//       'Air Jordan Bred',
//       'Nike sneakers',
//       'The Air Jordan Bred is the perfect sneaker for those who enjoy street style',
//       999.00,
//       _imageBred,
//       10,
//     ));
//     sneakers.add(Sneaker(
//       'Air Jordan Cactus Jack',
//       'Nike sneakers',
//       'The Air Jordan Cactus Jack is the perfect sneaker for those who enjoy street style',
//       1100.00,
//       _imageJack,
//       10,
//     ));
//     sneakers.add(Sneaker(
//       'Air Jordan OffWhite',
//       'Nike sneakers',
//       'The Air Jordan OffWhite is a perfect sneaker for those who enjoy street style',
//       899.00,
//       _imageOffwhite,
//       10,
//     ));
//     sneakers.add(Sneaker(
//       'Air Jordan OffWhite Chic',
//       'Nike sneakers',
//       'The Air Jordan OffWhite Chicago is a perfect sneaker for those who enjoy street style',
//       1050.00,
//       _imageChicago,
//       10,
//     ));
//     sneakers.add(Sneaker(
//       'Air Jordan OffWhite Unc',
//       'Nike sneakers',
//       'The Air Jordan OffWhite Unc is a perfect sneaker for those who enjoy street style',
//       349.00,
//       imageUnc,
//       10,
//     ));
//     _addAllSneakersSgbd();
//   }

//   static Sneaker getSneaker(int index) => sneakers[index];

//   static int lengthBase() => sneakers.length;
// }

// void _addAllSneakersSgbd() {
//   try {
//     for (var sneaker in ListSneakers.sneakers) {
//       Connection.connection.query(
//           'INSERT INTO tenis(nome, descricao, subdescricao, preco, imagem, quantidade) VALUES (@nome, @descricao, @subdescricao, @preco, @imagem, @quantidade)',
//           substitutionValues: {
//             'nome': sneaker.getName,
//             'descricao': sneaker.getDescription,
//             'subdescricao': sneaker.getSubdescription,
//             'preco': sneaker.getPrice,
//             'imagem': sneaker.getImage,
//             'quantidade': sneaker.getAmount,
//           });
//     }
//     print('tenis adicionados no bd');
//   } catch (e) {
//     print('Erro ao adicionar');
//   }
// }
