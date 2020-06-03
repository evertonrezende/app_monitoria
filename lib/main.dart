import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:app_distribuida2/routes.dart' as Routes;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.grey[400],
        brightness: Brightness.light,
        scaffoldBackgroundColor: ColorTheme.primaryColor,
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white)
        ),
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
