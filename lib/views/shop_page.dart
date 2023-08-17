import 'package:flutter/material.dart';
import 'package:sneakers_store/utils/list_sneakers.dart';
import 'package:sneakers_store/views/home_page.dart';
import 'package:sneakers_store/widgets/logo.dart';

import '../models/sneaker.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int tempIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/imgs/background_shop.png',
              fit: BoxFit.cover,
            ),
          ),
          // Column dos elementos acima da Stack
          Column(
            children: [
              // Top bar
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Logo(),
                      ),
                      // Botão de opções
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert),
                          color: const Color(0XFF03052C),
                          iconSize: 30,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0XFFCBC7C8).withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // ListView dos tênis
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ListSneakers.lengthBase(),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 150,
                      height: 150,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              tempIndex = index;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0XFFFFFFFF),
                            elevation: 0.75,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: Transform.rotate(
                            angle: -0.5,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ListSneakers.getSneakers(index).getImage,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Stack(
                children: [
                  infoTenis(ListSneakers.getSneakers(tempIndex)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 460,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 5,
                              shape: const CircleBorder(),
                              minimumSize: const Size(75, 60),
                              backgroundColor: const Color(0XFF03052C),
                            ),
                            child: const Icon(
                              Icons.ios_share_rounded,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shape: const CircleBorder(),
                                minimumSize: const Size(75, 60),
                                backgroundColor: const Color(0XFFA0CCF2)),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          )
                        ],
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

Widget infoTenis(Sneaker tenis) {
  return SizedBox(
    child: Column(
      children: [
        // Imagem do tênis
        SizedBox(
          width: 300,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Transform.rotate(
              angle: -0.5,
              child: tenis.getImage,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                tenis.getName,
                style: const TextStyle(
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0XFF03052C),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                tenis.getDescription,
                style: const TextStyle(
                  fontFamily: 'Oufit',
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Color(0XFF03052C),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                tenis.getSubdescription,
                style: const TextStyle(
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.normal,
                  color: Color(0XFF03052C),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Price',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 20,
                  color: Color(0XFF03052C),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '\$${tenis.getPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color(0XFF03052C),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
