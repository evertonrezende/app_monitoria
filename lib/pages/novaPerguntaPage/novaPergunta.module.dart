import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/providers/disciplina.provider.dart';
import 'package:app_distribuida2/providers/duvida.provider.dart';
import 'package:app_distribuida2/models/apiResponse.model.dart';
import 'package:app_distribuida2/providers/materia.provider.dart';
import 'package:app_distribuida2/utils/alert.dart';
import 'package:flutter/material.dart';

// Verifica se foi inserido uma pergunta
String validatePergunta(String text) {
  if (text.isEmpty) {
    return "Digite uma pergunta";
  }
  return null;
}

// Verifica se uma opção do dropdown foi selecionada
String validateDropDown(int value) {
  if (value == null || value.toString().isEmpty) {
    return "Selecione uma opção";
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
  ApiResponse<dynamic> response = await DuvidaApi.postDuvida(assunto, id_materia);

  if (response.ok) {
    alert(context, "Sucesso", "Pergunta enviada!");
  } else {
    alert(context, "Ops", "Houve um erro ao enviar a pergunta.");
  }
}  

// Lista todas as disciplinas
Future<List<Disciplina>> getDisciplinas(context) async {
  ApiResponse<List<Disciplina>> response = await DisciplinaApi.getDisciplinas();

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return [];
  }

  return response.result;
}

// Lista todas as matérias
Future<List<Materia>> getMaterias(context, int id_disciplina) async {
  ApiResponse<List<Materia>> response = await MateriaApi.getMaterias(id_disciplina);

  if (!response.ok) {
    alert(context, "Ops!", response.msg);
    return [];
  }

  return response.result;
}
