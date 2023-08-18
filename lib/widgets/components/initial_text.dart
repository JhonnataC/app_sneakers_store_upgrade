import 'package:flutter/material.dart';

class InitialText extends StatelessWidget {
  const InitialText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 35),
          child: SizedBox(
            width: 270,
            height: 270,
            child: FittedBox(
              child: Transform.rotate(
                angle: -0.3,
                child: Image.asset(
                  'assets/imgs/air_jordan1_offwhite.png',
                ),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text('WINTER \nCOLLECTIONS',
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 180),
              child: SizedBox(
                child: Text(
                  '2023',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Text(
                'Feel free and spend the winter \nin the style you deserve',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            )
          ],
        ),
      ],
    );
  }
}
