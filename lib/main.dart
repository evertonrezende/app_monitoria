import 'package:flutter/material.dart';
import 'pages/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          accentColor: Colors.white, //cor da tabs
          primaryColor: Colors.white,
          brightness: Brightness.light,
          //cardColor: Colors.white,
          scaffoldBackgroundColor: Color(0XFF009086),
          canvasColor: Color(0XFF69C2B0), //cor do Drawer (Menu)

          //scaffoldBackgroundColor: Color(0XFFE6E6FA),
          primaryTextTheme: TextTheme( 
              title: TextStyle( 
              color: Colors.white //cor padrão do Menu
              )
          ),
          
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          
      ),
      home:  LoginPage(),
      );
    }
  }
 
 

