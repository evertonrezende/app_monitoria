import 'package:flutter/material.dart';

class AppText extends StatefulWidget {
  //foi incluido o final nos atributos em virtude de um alerta do Flutter.
  final String label;
  final String hint;
  final bool password;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FocusNode focusNode;
  final FocusNode nextFocus;

  AppText(
    this.label,
    this.hint, {
    this.password = false,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.focusNode,
    this.nextFocus,
  });

  @override
  _AppTextState createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.password,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onFieldSubmitted: (String text) {
        if (widget.nextFocus != null) {
          FocusScope.of(context).requestFocus(widget.nextFocus);
        }
      },
      style: TextStyle(
        fontSize: 25,
       // color: Colors.blue,
        color: Color(0XFF009086), //cor do texto campo de Matricula e Senha
      ),
      decoration: InputDecoration(
       // border: OutlineInputBorder(
          //borderRadius: BorderRadius.circular(16)
        //),
      
        labelText: widget.label,
        labelStyle: TextStyle(
          fontSize: 22,
          color: Colors.grey,
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
