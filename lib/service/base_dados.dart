import 'package:sneakers_store/models/tenis.dart';
import 'package:sneakers_store/models/usuario.dart';
import 'package:sneakers_store/service/connection.dart';

class BaseDados {
  static final conexao = Connection.conexao;

  static getUsuario(Usuario usuario) {}

  static getTenis(Tenis tenis) {}

  static Future<bool> addUsuario(String login, String senha) async {
    try {
      await conexao.open();
      conexao.query(
        'INSERT INTO usuario(login, senha) VALUES (@login, @senha)',
        substitutionValues: {
          'login': login,
          'senha': senha,
        },
      );
      return true;
    } catch (e) {
      return false;
    } finally {
      conexao.close();
    }
  }

  static removerUsuario(Usuario usuario) {}

  static removerTenis(Tenis tenis) {}

  static registrarCompra(Usuario usuario, Tenis tenis) {}
}