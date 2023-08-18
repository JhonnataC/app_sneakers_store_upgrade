import 'package:flutter/material.dart';
import 'package:sneakers_store/widgets/components/login_form.dart';
import 'package:sneakers_store/widgets/components/initial_text.dart';

import '../widgets/components/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/imgs/background_home.png',
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Logo(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: MediaQuery.of(context).size.height),
              const SizedBox(height: 35),
              const InitialText(),
              const SizedBox(height: 10),
              const InitialForm(),
            ],
          )
        ],
      ),
    );
  }
}
