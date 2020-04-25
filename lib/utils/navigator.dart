import 'package:flutter/material.dart';

// Navega até uma rota específica e a declara como root eliminando todas as outras páginas da árvore
Future pushPageAsRoot(BuildContext context, String route,
    {Object paramenters}) {
  return Navigator.of(context).pushNamedAndRemoveUntil(route, ModalRoute.withName(route));
}

// Navega até uma rota específica substituindo-a pela última página acessada
Future pushAndReplaceLastPage(BuildContext context, String route,
    {Object paramenters}) {
  return Navigator.of(context).pushReplacementNamed(route);
}

// Navega até uma rota específica
Future pushPage(BuildContext context, String route, {Object paramenters}) {
  return Navigator.of(context).pushNamed(route, arguments: paramenters);
}

// Navega até um Widget específico
Future pushPageByWidget(BuildContext context, Widget page) {
  return Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

// Retorna até a última página acessada
popPage(BuildContext context) {
  return Navigator.pop(context);
}
