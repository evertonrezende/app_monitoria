import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:flutter/material.dart';
import 'package:app_distribuida2/routes.dart' as Routes;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.white, //cor da tabs
        primaryColor: Colors.grey[400],
        brightness: Brightness.light,
        scaffoldBackgroundColor: ColorTheme.primaryColor,
        canvasColor: ColorTheme.secondaryColor, 
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
