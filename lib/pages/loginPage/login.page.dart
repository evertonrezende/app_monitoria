import 'package:app_distribuida2/widgets/submitButton.widget.dart';
import 'package:app_distribuida2/widgets/appText.widget.dart';
import 'package:flutter/material.dart';
import './login.module.dart' as Module;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();
  final _focusSenha = FocusNode();

  bool _showProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _form());
  }

  Form _form() {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            _logo(),
            _textField("Matrícula", "Digite a matrícula", _tLogin,
                Module.validateLogin,
                action: TextInputAction.next, nextNode: _focusSenha, icon: Icons.person),
            _textField("Senha", "Digite a senha", _tSenha, Module.validateSenha,
                isPassword: true,
                action: TextInputAction.done,
                focusNode: _focusSenha, icon: Icons.lock),
            Container(
                padding: EdgeInsets.only(top: 0, left: 30, right: 30),
                child: _submit(context)),
          ],
        ),
      ),
    );
  }

  // Retorna a logo da aplicação
  SizedBox _logo() {
    return SizedBox(
        child: Image(
          image: AssetImage("assets/images/login.png")
        )
    );
  }

  // Retorna um campo de texto preenchível
  Container _textField(String title, String description,
      TextEditingController controller, Function validator,
      {bool isPassword = false, TextInputAction action, FocusNode nextNode, FocusNode focusNode, IconData icon}) {
    return new Container(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
      child: AppText(title, description,
          nextFocus: nextNode,
          focusNode: focusNode,
          controller: controller,
          validator: validator,
          textInputAction: action,
          password: isPassword,
          icon: icon),
    );
  }

  // Retorna um botão de submit
  SubmitButton _submit(context) {
    return SubmitButton(
      "Entrar",
      callbackFunction(() async {
        setState(() {
          _showProgress = true;
        });
        await Module.onClickLogin(context, _formKey, _tLogin.text, _tSenha.text);
        setState(() {
          _showProgress = false;
        });
      }),
      showProgress: _showProgress,
    );
  }

  // Realiza uma ação específica
  callbackFunction(Function callback) {
    return callback;
  }

  // Remove a página de login da árvore de páginas quando muda-se de página
  @override
  void dispose() {
    super.dispose();
  }
}
