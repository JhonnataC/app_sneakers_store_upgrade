import 'package:postgres/postgres.dart';

class Usuario {
  String login;
  String password;

  Usuario(
    this.login,
    this.password,
  );

  factory Usuario.fromMap(PostgreSQLResult usuarioMap) {
    final usuario = usuarioMap.first.first;
    return Usuario(
      usuario['login'],
      usuario['senha'],
    );
  }
}
