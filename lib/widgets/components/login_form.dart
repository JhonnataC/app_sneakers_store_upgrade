import 'package:flutter/material.dart';
import 'package:sneakers_store/service/base_dados.dart';
import 'package:sneakers_store/views/registration_page.dart';

import '../../views/shop_page.dart';
import '../custom/button_custom.dart';
import '../custom/text_field_custom.dart';

class InitialForm extends StatefulWidget {
  const InitialForm({super.key});

  @override
  State<InitialForm> createState() => _InitialFormState();
}

class _InitialFormState extends State<InitialForm> {
  final formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscuredPasswordText = true;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            child: TextFieldCustom(
              label: 'Login',
              controller: loginController,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'fill in the field login!';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: TextFieldCustom(
              label: 'Password',
              controller: passwordController,
              obscureText: obscuredPasswordText,
              suffix: IconButton(
                icon: Icon(
                  obscuredPasswordText
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    obscuredPasswordText = !obscuredPasswordText;
                  });
                },
              ),
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'fill in the field password!';
                }
                return null;
              },
            ),
          ),
          flag
              ? Text(
                  'login or passwords are wrong',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.red[900],
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            height: 50,
            child: ButtonCustom(
              label: 'Sign in',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (await BaseDados.isUser(
                      loginController.text, passwordController.text)) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShopPage(userLogged: loginController.text),
                      ),
                    );
                  } else {
                    setState(() {
                      flag = true;
                    });
                  }
                }
              },
            ),
          ),
          SizedBox(
            child: Text(
              'Or',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          // Botão
          SizedBox(
            width: 200,
            height: 50,
            child: ButtonCustom(
              label: 'Get Started',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegistrationPage(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
