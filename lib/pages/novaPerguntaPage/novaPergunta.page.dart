import 'package:app_distribuida2/models/disciplina.model.dart';
import 'package:app_distribuida2/models/materia.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/widgets/submitButton.widget.dart';
import 'package:flutter/material.dart';
import './novaPergunta.module.dart' as Module;

class NovaPerguntaPage extends StatefulWidget {
  @override
  _NovaPerguntaState createState() => _NovaPerguntaState();
}

class _NovaPerguntaState extends State<NovaPerguntaPage> {
  List<Disciplina> _disciplinas = new List<Disciplina>();
  List<Materia> _materias = new List<Materia>();
  final _tPergunta = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showProgress = false;
  int _id_disciplina;
  int _id_materia;

  @override
  void initState() {
    super.initState();    

    Module.getDisciplinas(context).then((disciplinas) {
      setState(() {
        _disciplinas = disciplinas;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _form());
  }

  Form _form() {
    return Form(
      key: _formKey,
      child: Container(
        color: ColorTheme.backgroundNeutroColor,
        child: ListView(
          children: <Widget>[
            _dropdownField(_id_disciplina, "Selecione uma disciplina", 
              _disciplinas.map((Disciplina d) {
                return DropdownMenuItem<int>(
                  child: Text(d.nome.length > 30? d.nome.substring(0, 30) + "..." : d.nome),
                  value: d.id,
                );
              }).toList(),
              (value) {
                setState(() {
                  _id_disciplina = value;
                  _id_materia = null;
                  _materias = [];  
                });
                 Module.getMaterias(context, _id_disciplina).then(
                   (list) =>  setState(() {_materias = list;})
                 );           
                }
            ),
            _dropdownField(_id_materia, "Selecione uma matéria", 
              _materias.map((Materia m) {
                  return DropdownMenuItem<int>(
                    child: Text(m.nome.length > 30? m.nome.substring(0, 30) + "..." : m.nome),
                    value: m.id,
                  );
                }).toList(),
              (value) {
                setState(() {
                  _id_materia = value;           
                });
              }
            ),
            _perguntaField(),
            Container(
                padding: EdgeInsets.only(top: 0, left: 30, right: 30),
                child: _submit(context)),
          ],
        ),
      ),
    );
  }

  // Retorna um campo de dropdown
  _dropdownField(int selected, String label, List<Widget> list, Function(int) functionOnChange) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: DropdownButtonFormField<int>(
          validator: Module.validateDropDown,
          items: list,
          onChanged: functionOnChange,
          hint: Text(label),
          value: selected,
        )
    );
  }

  // Retorna um campo de texto preenchível
  Widget _perguntaField() {
    final maxLines = 7;

    return Container(
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
        await Module.onClickSendPergunta(context, _formKey, _tPergunta.text, _id_materia);
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
