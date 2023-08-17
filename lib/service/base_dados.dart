import 'dart:ui';

import 'package:sneakers_store/models/sneaker.dart';
import 'package:sneakers_store/models/user.dart';
import 'package:sneakers_store/service/connection.dart';

class BaseDados {
  static final _connection = Connection.connection;

  // static void _createTables() async {
  //   await _connection.query(
  //       'CREATE TABLE IF NOT EXISTS usuario (id SERIAL PRIMARY KEY,login VARCHAR(20) UNIQUE NOT NULL,	senha VARCHAR(20) NOT NULL)');

  //   await _connection.query(
  //       'CREATE TABLE IF NOT EXISTS tenis (id SERIAL PRIMARY KEY, nome VARCHAR(100) UNIQUE NOT NULL, descricao VARCHAR(255), subdescricao VARCHAR(255), preco NUMERIC(6,2),	imagem BYTEA,	quantidade INT)');

  //   await _connection.query(
  //       'CREATE TABLE IF NOT EXISTS compra ( id SERIAL PRIMARY KEY,	usuario_id INT NOT NULL REFERENCES usuario(id),	tenis_id INT NOT NULL REFERENCES tenis(id))');
  // }

  static Future<bool> isUser(String login, String password) async {
    try {
      final usuario = await _connection.query(
        'SELECT * FROM usuario WHERE login = @login AND senha = @senha',
        substitutionValues: {
          'login': login,
          'senha': password,
        },
      );
      if (usuario.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('ERRO NO IS USUARIO');
      return false;
    }
  }

  static Future<bool> addUser(String login, String password) async {
    try {
      print('query INSERT a seguir');
      _connection.query(
        'INSERT INTO usuario(login, senha) VALUES (@login, @senha)',
        substitutionValues: {
          'login': login,
          'senha': password,
        },
      );
      return true;
    } catch (e) {
      print('ERRO NO ADD USUARIO');
      print(e);
      return false;
    }
  }

  static Future<User?> getUser(String login, String password) async {
    try {
      final result = await _connection.query(
        'SELECT * FROM usuario WHERE login = @login AND senha = @senha',
        substitutionValues: {
          'login': login,
          'senha': password,
        },
      );
      if (result.isNotEmpty) {
        final user = User.fromMap(result);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print('ERRO NO GET USUARIO');
      return null;
    }
  }

  static Future<bool> isSneaker(String name) async {
    try {
      final sneaker = await _connection.query(
        'SELECT * FROM tenis WHERE nome = @name',
        substitutionValues: {
          'name': name,
        },
      );

      if (sneaker.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('ERRO NO IS TENIS');
      return false;
    }
  }

  static Future<bool> addSneaker(String name, String description,
      String subDescription, double price, Image image, int amount) async {
    try {
      if (await isSneaker(name)) {
        _connection.query(
          'UPDATE tenis SET quantidade = quantidade + @quantidade WHERE nome ILIKE @name',
          substitutionValues: {
            'quantidade': amount,
            'name': name,
          },
        );
      } else {
        _connection.query(
          'INSERT INTO tenis(nome, descricao, subdescricao, preco, imagem, quantidade) VALUES(@nome, @descricao, @subdescricao, @preco, @imagem, @quantidade)',
          substitutionValues: {
            'nome': name,
            'descricao': description,
            'subdescricao': subDescription,
            'preco': price,
            'imagem': image, // Converter para bytes
            'quantidade': amount,
          },
        );
      }
      return true;
    } catch (e) {
      print('ERRO NO ADD TENIS');
      return false;
    }
  }

  static Future<Sneaker?> getSneaker(String name) async {
    try {
      final tenisMap = await _connection.query(
        'SELECT * FROM tenis WHERE nome ILIKE @nome',
        substitutionValues: {
          'nome': name,
        },
      );
      return Sneaker.fromMap(tenisMap);
    } catch (e) {
      print('ERRO NO GET TENIS');
      return null;
    }
  }

  static Future<void> updateSneaker(String name, int amount) async {
    try {
      _connection.query(
        'UPDATE tenis SET quantidade = quantidade - @quantidade WHERE nome ILIKE @nome',
        substitutionValues: {
          'nome': name,
          'quantidade': amount,
        },
      );
    } catch (e) {
      print('ERRO NO UPDATE TENIS');
    }
  }

  // static Future<int> getIdUsuario(String login) async {
  //   final usuarioMap = await _connection.query(
  //     'SELECT id FROM usuario WHERE login LIKE @login',
  //     substitutionValues: {
  //       'login': login,
  //     },
  //   );
  //   if (usuarioMap.isNotEmpty) {
  //     final usuario = usuarioMap.first;
  //     return usuario[];
  //   }
  // }

  // static Future<int> getIdTenis(String nome) async {}

  // static bool registrarCompra(Usuario usuario, Tenis tenis) {}
}
