import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/widgets/submitButton.widget.dart';
import 'package:flutter/material.dart';
import './novaPergunta.module.dart' as Module;

class NovaPerguntaPage extends StatefulWidget {
  @override
  _NovaPerguntaState createState() => _NovaPerguntaState();
}

class _NovaPerguntaState extends State<NovaPerguntaPage> {
  final _formKey = GlobalKey<FormState>();
  final _tPergunta = TextEditingController();
  bool _showProgress = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _form());
  }

  Form _form() {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            _perguntaField(),
            Container(
                padding: EdgeInsets.only(top: 0, left: 30, right: 30),
                child: _submit(context)),
          ],
        ),
      ),
    );
  }

  // Retorna um campo de texto preenchível
  Widget _perguntaField() {
    final maxLines = 10;

    return new Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      height: maxLines * 24.0,
      child: TextFormField(
        controller: _tPergunta,
        validator: Module.validatePergunta,
        keyboardType: TextInputType.multiline,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 16,
          color: ColorTheme.primaryColor,
        ),      
        decoration: InputDecoration(     
          hintText: "Digite sua pergunta",
          hintStyle: TextStyle(
            fontSize: 16,
          ),
        ),
        )
    );
  }

  // Retorna um botão de submit
  SubmitButton _submit(context) {
    return SubmitButton(
      "Enviar",
      callbackFunction(() async {
        setState(() {
          _showProgress = true;
        });
        // await Module.onClickSendPergunta(context, _formKey, _tPergunta.text, _tSenha.text);
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
