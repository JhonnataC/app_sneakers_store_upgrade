import 'package:flutter/material.dart';

import 'logo.dart';

class TopBar extends StatelessWidget {
  final String userLogged;
  final IconButton button;

  const TopBar({
    super.key,
    required this.userLogged,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Logo(),
            ),
            Text(
              userLogged,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: button,
            ),
          ],
        ),
      ),
    );
  }
}
