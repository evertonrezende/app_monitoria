
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function onPressed;

  AppButton(this.text, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      
      child: RaisedButton(
         
        color: Color(0XFF009086),
        splashColor: Colors.red,
        shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5),
       
                   
        ),
         
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            
            fontSize: 22,
          ),
        ),
        
        onPressed: onPressed,
      ),
    );

    
  }
}
