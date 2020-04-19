import 'package:app_distribuida2/providers/login.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/models/usuario.model.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:app_distribuida2/utils/alert.dart';
import 'package:flutter/material.dart';

// Verifica se uma senha é válida
String validateSenha(String text) {
  if (text.isEmpty) {
    return "Digite a senha";
  }
  if (text.length < 3) {
    return "A senha precisa ter pelo menos 3 dígitos";
  }
  return null;
}

// Valida se o e-mail foi inserido
String validateLogin(String text) {
  if (text.isEmpty) {
    return "Digite o login";
  }
  return null;
}

// Realiza o login do usuário
Future<void> onClickLogin(context, GlobalKey<FormState> form, String login, String senha) async {
  //validação do formulário
  if (!form.currentState.validate()) {
    return;
  }

  //invoca API de login
  ApiResponse<Usuario> response = await LoginApi.login(login, senha);

  if (response.ok) {
    pushPage(context, '/home', paramenters: response.result);
  } else {
    alert(context, "Login", response.msg);
  }
}
