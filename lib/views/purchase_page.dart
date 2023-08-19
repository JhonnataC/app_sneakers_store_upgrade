import 'package:flutter/material.dart';
import 'package:sneakers_store/widgets/components/top_bar.dart';
import 'package:sneakers_store/widgets/custom/button_custom.dart';

import '../models/sneaker.dart';

class PurchasePage extends StatelessWidget {
  final Sneaker sneaker;
  final String userLogged;

  const PurchasePage({
    super.key,
    required this.sneaker,
    required this.userLogged,
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
          Column(
            children: [
              TopBar(
                userLogged: userLogged,
                button: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  color: const Color(0XFF03052C),
                  iconSize: 30,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0XFFCBC7C8).withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Transform.rotate(
                  angle: -0.5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: Image.network(
                      sneaker.getImage,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 200,
                child: ButtonCustom(
                  label: 'Buy',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
