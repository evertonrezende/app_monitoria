import 'package:app_distribuida2/pages/materiasPage/materias.page.dart';
import 'package:app_distribuida2/pages/monitoresPage/monitores.page.dart';
import 'package:app_distribuida2/pages/loginPage/login.page.dart';
import 'package:app_distribuida2/pages/homePage/home.page.dart';
import 'package:flutter/material.dart';


// Registro de todas as rotas (páginas de navegação) da aplicação
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage(settings.arguments));
    case '/home/monitores':
      return MaterialPageRoute(builder: (context) => MonitoresPage());
    case '/home/disciplina/materias':
      return MaterialPageRoute(builder: (context) => MateriasPage(settings.arguments));
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
