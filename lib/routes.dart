import 'package:app_distribuida2/pages/perguntasFrequentesPage/perguntasFrequentes.page.dart';
import 'package:app_distribuida2/pages/conteudoPage/conteudos.page.dart';
import 'package:app_distribuida2/pages/materiasPage/materias.page.dart';
import 'package:app_distribuida2/pages/metricasPage/metricas.page.dart';
import 'package:app_distribuida2/pages/monitoresPage/monitores.page.dart';
import 'package:app_distribuida2/pages/loginPage/login.page.dart';
import 'package:app_distribuida2/pages/homePage/home.page.dart';
import 'package:app_distribuida2/pages/root.page.dart';
import 'package:flutter/material.dart';


// Registro de todas as rotas (páginas de navegação) da aplicação
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => RootPage());
    case '/login':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/home':
      return MaterialPageRoute(builder: (context) => HomePage());
    case '/home/monitores':
      return MaterialPageRoute(builder: (context) => MonitoresPage());
    case '/home/metricas':
      return MaterialPageRoute(builder: (context) => MetricasPage());
    case '/home/disciplina/materias':
      return MaterialPageRoute(builder: (context) => MateriasPage(settings.arguments));
    case '/home/disciplina/materias/conteudo':
      return MaterialPageRoute(builder: (context) => ConteudosPage(settings.arguments));
    case '/home/disciplina/materias/perguntas-frequentes':
      return MaterialPageRoute(builder: (context) => PerguntasFrequentesPage()); 
    default:
      return MaterialPageRoute(builder: (context) => LoginPage());
  }
}
