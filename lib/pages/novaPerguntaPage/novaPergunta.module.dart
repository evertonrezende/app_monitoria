import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/providers/duvida.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/utils/alert.dart';
import 'package:flutter/material.dart';

// Verifica se foi inserido uma pergunta
String validatePergunta(String text) {
  if (text.isEmpty) {
    return "Digite uma pergunta";
  }
  return null;
}

// Salva a pergunta do usuário
Future<void> onClickSendPergunta(context, GlobalKey<FormState> form, String assunto, int id_materia) async {
  //validação do formulário
  if (!form.currentState.validate()) {
    return;
  }

  //invoca API de login
  ApiResponse<Duvida> response = await DuvidaApi.postDuvida(assunto, id_materia);

  if (response.ok) {
    alert(context, "Sucesso", "Pergunta enviada!");
  } else {
    alert(context, "Ops", "Houve um erro ao enviar a pergunta.");
  }
}
