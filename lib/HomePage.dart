import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/imgs/background_home3.png',
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text(
              'SS',
              style: TextStyle(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Width da column
              SizedBox(
                width: MediaQuery.of(context).size.width,
              ),
              const SizedBox(
                height: 100,
              ),
              // Imagem
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: SizedBox(
                  width: 310,
                  height: 310,
                  child: Transform.rotate(
                    angle: -0.3,
                    child: Image.asset(
                      'assets/imgs/air_jordan1_offwhite.png',
                    ),
                  ),
                ),
              ),
              // Texto principal
              const SizedBox(
                child: Text(
                  'WINTER \nCOLLECTIONS',
                  style: TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color(0XFF03052C),
                  ),
                ),
              ),
              // Texto ano
              const Padding(
                padding: EdgeInsets.only(right: 180),
                child: SizedBox(
                  child: Text(
                    '2023',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Subtexto
              const SizedBox(
                child: Text(
                  'Feel free and spend the winter \nin the style you deserve',
                  style: TextStyle(
                    color: Color(0XFF03052C),
                    fontFamily: 'Outfit',
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Botão
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFF515259),
                    elevation: 10,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
