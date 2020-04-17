import 'package:app_distribuida2/providers/login.provider.dart';
import 'package:app_distribuida2/models/usuario.dart';
import 'package:app_distribuida2/utils/alert.dart';
import 'package:app_distribuida2/utils/nav.dart';
import 'package:app_distribuida2/widgets/app_button.dart';
import 'package:app_distribuida2/utils/api_response.dart';
import 'package:app_distribuida2/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'home.page.dart';

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
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        color: const Color(0XFFFFFFFF),
        padding: EdgeInsets.only(
            ),
        child: ListView(
          children: <Widget>[
            SizedBox(
                child: Image.asset(
              "assets/images/v.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            )
                ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 15, left: 30, right: 30, bottom: 20),
              child: AppText(
                "Matrícula",
                "Digite a matrícula",
                controller: _tLogin,
                validator: _validateLogin,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha,
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: AppText(
                "Senha",
                "Digite a senha",
                controller: _tSenha,
                password: true,
                validator: _validateSenha,
                focusNode: _focusSenha,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: AppButton(
                "Entrar",
                onPressed: _onClickLogin,
                showProgress: _showProgress,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onClickLogin() async {
    //validação do formulário
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");

    setState(() {
      _showProgress = true;
    });

    //invoca API de login
    ApiResponse<Usuario> response = await LoginApi.login(login, senha);

    if (response.ok) {
      Usuario user = response.result;
      print(">>> $user");

      push(context, HomePage());
    } else {
      alert(context, response.msg);
    }

    //Este método é invocado novamente pois quando retonarmos da Home a animação de progresso não ficar executando
    setState(() {
      _showProgress = false;
    });
  }

  String _validateLogin(String text) {
    if (text.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String text) {
    if (text.isEmpty) {
      return "Digite a senha";
    }
    if (text.length < 3) {
      return "A senha precisa ter pelo menos 3 dígitos";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}