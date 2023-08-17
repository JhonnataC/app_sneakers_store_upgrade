import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Error(),
    );
  }
}

class Error extends StatelessWidget {
  const Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFA0CCF2),
      appBar: AppBar(
        title: const Text(
          'Info',
          style: TextStyle(
            fontFamily: 'Outfit',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0XFF03052C),
          ),
        ),
        backgroundColor: const Color(0XFFA0CCF2),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Unfortunately we were unable to connect to our servers, please try again later!',
              style: TextStyle(
                color: Color(0XFF03052C),
                fontFamily: 'Outfit',
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFF515259),
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text(
                'Exit',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
          )
        ],
      ),
    );
  }
}
