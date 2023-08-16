import 'package:flutter/material.dart';
import 'package:sneakers_store/service/base_dados.dart';
import 'package:sneakers_store/views/registration_page.dart';

import '../views/shop_page.dart';
import 'custom/button_custom.dart';
import 'custom/text_field_custom.dart';

class InitialForm extends StatelessWidget {
  InitialForm({super.key});
  final formKey = GlobalKey<FormState>();

  Future<bool> _validateUser(String login, String password) async {
    return await BaseDados.isUsuario(login, password);
  }

  @override
  Widget build(BuildContext context) {
    final loginController = TextEditingController();
    final passwordController = TextEditingController();

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
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'fill in the field password!';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            height: 50,
            child: ButtonCustom(
              label: 'Sign in',
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (await _validateUser(
                      loginController.text, passwordController.text)) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ShopPage(),
                      ),
                    );
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
                    builder: (context) => RegistrationPage(),
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
