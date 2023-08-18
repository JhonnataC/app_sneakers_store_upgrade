import 'package:flutter/material.dart';
import 'package:sneakers_store/models/sneaker.dart';
import 'package:sneakers_store/service/base_dados.dart';
import 'package:sneakers_store/utils/list_sneakers.dart';
import 'package:sneakers_store/views/home_page.dart';
import 'package:sneakers_store/views/purchase_page.dart';
import 'package:sneakers_store/widgets/components/logo.dart';
import 'package:sneakers_store/widgets/components/sneakers_info.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  int tempIndex = 0;
  late Sneaker sneakerCurrent;

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
          // Column dos elementos sob a Stack
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
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          icon: const Icon(Icons.logout_rounded),
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
                              sneakerCurrent = ;
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
                              child: Image.memory(
                                ListSneakers.getSneakers(index).getImage,
                              ),
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
                  SneakersInfo(
                    sneaker: ListSneakers.getSneakers(tempIndex),
                  ),
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
                            style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shape: const CircleBorder(),
                                minimumSize: const Size(75, 60),
                                backgroundColor: const Color(0XFFA0CCF2)),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PurchasePage(),
                                ),
                              );
                            },
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
