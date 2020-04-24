import 'package:app_distribuida2/utils/navigator.dart'as Navigator;
import 'package:app_distribuida2/utils/appStorage.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {

  void loadUser(context) {
    AppStorage.getCurrentUser().then((user) {  
        // Delay para exibir o Load
        Future.delayed(Duration(milliseconds: 500), () {    
        if (user != null) 
          Navigator.pushAndReplaceLastPage(context, '/home', paramenters: user);
        else 
          Navigator.pushAndReplaceLastPage(context, '/login');
      });
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    loadUser(context);
        return buildWaitingScreen();
  }
}