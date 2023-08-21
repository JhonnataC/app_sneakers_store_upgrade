import 'dart:typed_data';
import 'dart:ui';

import 'package:sneakers_store/models/sneaker.dart';
import 'package:sneakers_store/models/user.dart';
import 'package:sneakers_store/service/connection.dart';

class BaseDados {
  static final _connection = Connection.connection;
  static final List<Sneaker> sneakersList = [];

  static createSneakersList() async {
    var sneakersListsSgbd = await _connection.query('SELECT * FROM tenis');

    try {
      for (var sneakerSgbd in sneakersListsSgbd) {
        sneakersList.add(
          Sneaker.named(
            name: sneakerSgbd[1],
            description: sneakerSgbd[2],
            subdescription: sneakerSgbd[3],
            price: double.tryParse(sneakerSgbd[4]) ?? 0.0,
            image: sneakerSgbd[5],
            quantity: sneakerSgbd[6],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  static int lengthBase() => sneakersList.length;

  static Sneaker getSneaker(int index) => sneakersList[index];

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
      print(e);
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
      print(e);
      return false;
    }
  }

  static Future<int> getIdUser(String login) async {
    try {
      final userMap = await _connection.query(
        'SELECT id FROM usuario WHERE login LIKE @login',
        substitutionValues: {
          'login': login,
        },
      );
      if (userMap.isNotEmpty) {
        final user = userMap.first;
        return user[0];
      } else {
        return -1;
      }
    } catch (e) {
      print(e);
      return -1;
    }
  }

  static Future<int> getIdSneaker(String sneakerName) async {
    try {
      final sneakerMap = await _connection.query(
          'SELECT id FROM tenis WHERE nome LIKE @nome',
          substitutionValues: {
            'nome': sneakerName,
          });
      if (sneakerMap.isNotEmpty) {
        final sneaker = sneakerMap.first;
        return sneaker[0];
      } else {
        return -1;
      }
    } catch (e) {
      print(e);
      return -1;
    }
  }

  static Future<void> _updateSneaker(int sneakerId) async {
    try {
      _connection.query(
        'UPDATE tenis SET quantidade = quantidade - 1 WHERE id = @id',
        substitutionValues: {
          'id': sneakerId,
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<bool> registerPurchase(int userId, int sneakerId) async {
    try {
      await _connection.query(
          'INSERT INTO compra(usuario_id, tenis_id) VALUES (@usuario_id, @tenis_id)',
          substitutionValues: {
            'usuario_id': userId,
            'tenis_id': sneakerId,
          });
      _updateSneaker(sneakerId);
      updateBase();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static void updateBase() {
    sneakersList.clear();
    createSneakersList();
  }
}
