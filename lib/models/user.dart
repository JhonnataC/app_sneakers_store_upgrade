import 'package:postgres/postgres.dart';

class User {
  String login;
  String password;

  User(
    this.login,
    this.password,
  );

  factory User.fromMap(PostgreSQLResult usuarioMap) {
    final usuario = usuarioMap.first.first;
    return User(
      usuario['login'],
      usuario['senha'],
    );
  }
}
