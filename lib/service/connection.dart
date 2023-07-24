import 'package:postgres/postgres.dart';

class Connection {
  static late final PostgreSQLConnection _connection;

  static Future<void> conectarBaseDeDados() async {
    _connection = PostgreSQLConnection(
      'localhost',
      5432,
      'base_store',
      username: 'postgres',
      password: '9090',
    );
  }

  static PostgreSQLConnection get conexao => _connection;
}
