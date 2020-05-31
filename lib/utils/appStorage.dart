import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class AppStorage {
  static final _storage = FlutterSecureStorage();

  // Recupera o usuário salva no storage criptografado
  static Future<Usuario> getCurrentUser() async {
    try {
      var response = await _storage.read(key: "user");

      if (response != null) {
        var a = json.decode(response);
        return Usuario.fromJson(a);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  // Recupera o usuário salva no storage criptografado
  static Future<void> setCurrentUser(Usuario usuario) async {
    await _storage.write(key: "user", value: usuario.toString());
  }

  // Limpa todos os dados em storage
  static Future<String> getItemSecure(String key) async {
    return await _storage.read(key: key);
  }

  // Recupera todos os dados no storage criptografado
  static Future<Map<String, String>> getAllItemsSecure() async {
    return await _storage.readAll();
  }

  // Salva um dado criptografado
  static Future<void> addNewItemSecure(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Limpa todos os dados em storage
  static Future<void> clearStorage() async {
    await _storage.deleteAll();
  }
}
