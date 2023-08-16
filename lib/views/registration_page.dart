import 'package:flutter/material.dart';
import 'package:sneakers_store/service/base_dados.dart';
import 'package:sneakers_store/widgets/custom/button_custom.dart';
import 'package:sneakers_store/widgets/custom/text_field_custom.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var passwordCache = '';
  var passwordConfirmCache = '';
  bool obscuredTextPassword = true;
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFA0CCF2),
      appBar: AppBar(
        title: Text(
          'Registration Page',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        backgroundColor: const Color(0XFFA0CCF2),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: TextFieldCustom(
                  label: 'Password',
                  controller: passwordController,
                  obscureText: obscuredTextPassword,
                  suffix: IconButton(
                    icon: Icon(
                      obscuredTextPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          obscuredTextPassword = !obscuredTextPassword;
                        },
                      );
                    },
                  ),
                  onChanged: (text) {
                    passwordCache = text;
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'fill in the field password!';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 200,
                child: TextFieldCustom(
                  label: 'Confirm password',
                  controller: confirmPasswordController,
                  obscureText: obscuredTextPassword,
                  suffix: IconButton(
                    icon: Icon(
                      obscuredTextPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(
                        () {
                          obscuredTextPassword = !obscuredTextPassword;
                        },
                      );
                    },
                  ),
                  onChanged: (text) {
                    passwordConfirmCache = text;
                  },
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'fill in the field password!';
                    }
                    if (!(passwordCache == passwordConfirmCache)) {
                      return 'different password';
                    }
                    return null;
                  },
                ),
              ),
              flag
                  ? const Text(
                      'Login already in use',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                      ),
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              ButtonCustom(
                label: 'All ready!',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (await BaseDados.isUsuario(
                        loginController.text, passwordController.text)) {
                      setState(() {
                        flag = true;
                      });
                    } else {
                      BaseDados.addUsuario(
                          loginController.text, passwordController.text);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context);
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
