import 'package:flutter/material.dart';

import '../../models/sneaker.dart';

class SneakersInfo extends StatelessWidget {
  final Sneaker sneaker;

  const SneakersInfo({super.key, required this.sneaker});

  @override
  Widget build(BuildContext context) {
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
                child: Image.memory(sneaker.getImage),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  sneaker.getName,
                  style: Theme.of(context).textTheme.titleMedium,
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
                  sneaker.getDescription,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                child: Text(
                  sneaker.getSubdescription,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Price:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '\$${sneaker.getPrice.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Available quantity:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  '${sneaker.getAmount}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
