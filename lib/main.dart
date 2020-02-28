import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simplifica AED',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0XFFE6E6FA),
        
      ),
      home:  LoginPage(),
      );
    }
  }
 
 

