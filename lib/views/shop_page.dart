import 'package:flutter/material.dart';
import 'package:sneakers_store/models/sneaker.dart';
import 'package:sneakers_store/service/base_dados.dart';
import 'package:sneakers_store/utils/list_sneakers.dart';
import 'package:sneakers_store/views/home_page.dart';
import 'package:sneakers_store/views/purchase_page.dart';
import 'package:sneakers_store/widgets/components/sneakers_info.dart';
import 'package:sneakers_store/widgets/components/top_bar.dart';

class ShopPage extends StatefulWidget {
  final String userLogged;

  const ShopPage({
    super.key,
    required this.userLogged,
  });

  @override
  // ignore: no_logic_in_create_state
  State<ShopPage> createState() => _ShopPageState(userLogged);
}

class _ShopPageState extends State<ShopPage> {
  final String userLogged;

  _ShopPageState(this.userLogged);

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
              TopBar(
                userLogged: userLogged,
                button: IconButton(
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
              const SizedBox(
                height: 20,
              ),
              // ListView dos tênis
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: BaseDados.lengthBase(),
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
                              sneakerCurrent = BaseDados.getSneaker(index);
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
                              child: Image.network(
                                BaseDados.getSneaker(index).getImage,
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
                    sneaker: BaseDados.getSneaker(tempIndex),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PurchasePage(
                                    sneaker: sneakerCurrent,
                                    userLogged: userLogged,
                                  ),
                                ),
                              );
                            },
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
