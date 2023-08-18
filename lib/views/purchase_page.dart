import 'package:flutter/material.dart';

import '../models/sneaker.dart';

class PurchasePage extends StatelessWidget {
  final Sneaker sneaker;

  const PurchasePage({
    super.key,
    required this.sneaker,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/imgs/background_shop.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
