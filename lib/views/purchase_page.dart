import 'package:flutter/material.dart';
import 'package:sneakers_store/service/base_dados.dart';
import 'package:sneakers_store/widgets/components/top_bar.dart';
import 'package:sneakers_store/widgets/custom/button_custom.dart';

import '../models/sneaker.dart';

class PurchasePage extends StatefulWidget {
  final Sneaker sneaker;
  final String userLogged;

  const PurchasePage({
    super.key,
    required this.sneaker,
    required this.userLogged,
  });

  @override
  State<PurchasePage> createState() => _PurchasePageState();
}

class _PurchasePageState extends State<PurchasePage> {
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
                userLogged: widget.userLogged,
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
                      widget.sneaker.getImage,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            widget.sneaker.getName,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      bottom: 20,
                    ),
                    child: Text(
                      widget.sneaker.getDescription,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Text(
                      widget.sneaker.getSubdescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Total: ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          '\$${widget.sneaker.getPrice.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 20),
                        height: 50,
                        width: 200,
                        child: ButtonCustom(
                          label: 'Buy now',
                          onPressed: widget.sneaker.getQuantity >= 0
                              ? () {
                                  BaseDados.buySneaker(widget.sneaker.getName, widget.userLogged);
                                }
                              : null,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
