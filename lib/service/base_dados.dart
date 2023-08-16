import 'dart:ui';

import 'package:sneakers_store/models/tenis.dart';
import 'package:sneakers_store/models/usuario.dart';
import 'package:sneakers_store/service/connection.dart';

class BaseDados {
  static final _conexao = Connection.conexao;

  static Future<bool> isUsuario(String login, String senha) async {
    try {
      final usuario = await _conexao.query(
        'SELECT * FROM usuario WHERE login = @login AND senha = @senha',
        substitutionValues: {
          'login': login,
          'senha': senha,
        },
      );

      if (usuario.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Erro ao se conectar com a base de dados');
      return false;
    } finally {
      await _conexao.close();
    }
  }

  static Future<Usuario?> getUsuario(String login, String senha) async {
    try {
      final result = await _conexao.query(
        'SELECT * FROM usuario WHERE login = @login AND senha = @senha',
        substitutionValues: {
          'login': login,
          'senha': senha,
        },
      );
      if (result.isNotEmpty) {
        final usuario = Usuario.fromMap(result);
        return usuario;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    } finally {
      await _conexao.close();
    }
  }

  static Future<bool> addUsuario(String login, String password) async {
    try {
      _conexao.query(
        'INSERT INTO usuario(login, senha) VALUES (@login, @senha)',
        substitutionValues: {
          'login': login,
          'senha': password,
        },
      );
      return true;
    } catch (e) {
      return false;
    } finally {
      await _conexao.close();
    }
  }

  static Future<bool> isTenis(String name) async {
    try {
      final tenis = await _conexao.query(
        'SELECT * FROM tenis WHERE nome = @name',
        substitutionValues: {
          'name': name,
        },
      );

      if (tenis.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Erro ao se conectar com a base de dados');
      return false;
    } finally {
      await _conexao.close();
    }
  }

  static Future<Tenis?> getTenis(String nome) async {
    try {
      final tenisMap = await _conexao.query(
        'SELECT * FROM tenis WHERE nome ILIKE @nome',
        substitutionValues: {
          'nome': nome,
        },
      );
      return Tenis.fromMap(tenisMap);
    } catch (e) {
      return null;
    } finally {
      await _conexao.close();
    }
  }

  static Future<bool> addTenis(String nome, String descricao,
      String subDescricao, double preco, Image imagem, int quantidade) async {
    try {
      if (await isTenis(nome)) {
        _conexao.query(
          'UPDATE tenis SET quantidade = quantidade + @quantidade WHERE nome ILIKE @name',
          substitutionValues: {
            'name': nome,
          },
        );
      } else {
        _conexao.query(
          'INSERT INTO tenis(nome, descricao, subdescricao, preco, imagem, quantidade) VALUES(@nome, @descricao, @subdescricao, @preco, @imagem, @quantidade)',
          substitutionValues: {
            'nome': nome,
            'descricao': descricao,
            'subdescricao': subDescricao,
            'preco': preco,
            'imagem': imagem, // Converter para bytes
            'quantidade': quantidade,
          },
        );
      }
      return true;
    } catch (e) {
      return false;
    } finally {
      await _conexao.close();
    }
  }

  static Future<void> updateTenis(String nome, int quantidade) async {
    try {
      _conexao.query(
        'UPDATE tenis SET quantidade = quantidade - @quantidade WHERE nome ILIKE @nome',
        substitutionValues: {
          'nome': nome,
          'quantidade': quantidade,
        },
      );
    } catch (e) {
      print('Erro ao se conectar com o banco de dados');
    } finally {
      await _conexao.close();
    }
  }

  // static Future<int> getIdUsuario(String login) async {
  //   final usuarioMap = await _conexao.query(
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
