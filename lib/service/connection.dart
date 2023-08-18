import 'package:postgres/postgres.dart';
import 'dart:developer' as dev;

class Connection {
  static late final PostgreSQLConnection _connection;

  static Future<bool> conectarSGBD() async {
    _connection = PostgreSQLConnection(
      '10.0.2.2',
      5432,
      'sneakers_store',
      username: 'postgres',
      password: '0909',
    );
    dev.log(
        'conectado a base: ${_connection.databaseName}, ${_connection.host}, ${_connection.password}, ${_connection.port} ');
    dev.log('abrindo conexao...');
    try {
      await _connection.open();
      dev.log('conexao aberta');
      return true;
    } catch (e) {
      dev.log('erro ao abrir conexao', error: e);
      return false;
    }
  }

  static PostgreSQLConnection get connection => _connection;
}
