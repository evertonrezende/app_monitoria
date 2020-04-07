
import 'package:app_distribuida2/utils/nav.dart';
import 'package:app_distribuida2/widgets/app_button.dart';
import 'package:app_distribuida2/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_api.dart';
//import 'login_api.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _focusSenha = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text("Carros"),
      //),
      body: _body(),
    );
  }

  _body() {
    
    return Form(
      
      key: _formKey,
      child: Container(
        color: const Color(0XFFFFFFFF),
        //padding: EdgeInsets.all(16),
        padding: EdgeInsets.only(
              //top:30, left:30, right:30, bottom:20
          ),
        child: ListView(
          children: <Widget>[
            SizedBox(
                  //width: 400,
                  child: Image.asset("assets/images/v.jpg",
                  height: 200,
                  width: double.infinity,
                  fit:BoxFit.fill,
                  )
                  //child: Container(backgroundColor: ),
                ),
                SizedBox(
                  height: 20,

                ),
             Container (
                padding: EdgeInsets.only(
                top:15, left:30, right:30, bottom:20
                ),
              child: AppText(
                "Matrícula",
                "Digite a matrícula",
                controller: _tLogin,
                validator: _validateLogin,
                keyboardType: TextInputType.number,
                //keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha,
              ),
            ),
            SizedBox(height: 10),
            Container (
                padding: EdgeInsets.only(
                left:30, right:30
                ),
            child: AppText(
              "Senha",
              "Digite a senha",
              controller: _tSenha,
              password: true,
              validator: _validateSenha,
              //keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            ),
            SizedBox(
              height: 20,
            ),
            Container (
                padding: EdgeInsets.only(
                left:30, right:30
                ),
            child:AppButton(
               
              "Entrar",
              onPressed: _onClickLogin,
               ),
            ),
                /*Container(
                  height: 40,
                  
                  child: FlatButton(
                    child:Text(
                      
                      "Esqueci minha senha",
                       style: TextStyle(
                           color:Color(0XFF009086),
                           fontSize: 15.0,
                       ),
                      textAlign:TextAlign.center,
                    ),
                    onPressed: (){
                     
                    }
                  ),
                )
                */
          ],
        ),
        
      ),
    );
  }

  void _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    print("Login: $login, Senha: $senha");

    bool ok = await LoginApi.login(login, senha);

    if(ok){
        push(context, HomePage());
    }else {
      print("Login incorreto!");
    }
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
