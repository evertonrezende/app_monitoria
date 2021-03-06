import 'package:app_distribuida2/models/conteudo.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:app_distribuida2/widgets/diagonalClipper.widget.dart';
import 'package:flutter/material.dart';
import './conteudo.module.dart' as Module;

class ConteudoPage extends StatefulWidget {
  final Conteudo _conteudo;

  ConteudoPage(this._conteudo);

  @override
  _ConteudoPageState createState() => _ConteudoPageState(_conteudo);
}

class _ConteudoPageState extends State<ConteudoPage> {
  Conteudo _conteudo;
  final double _imageHeight = 256.0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _feedbackEnable = true;
  
  _ConteudoPageState(this._conteudo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Tópico", style: Theme.of(context).textTheme.headline6),
        centerTitle: true,
        backgroundColor: ColorTheme.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => popPage(context),
        ),
      ),
      backgroundColor: ColorTheme.backgroundNeutroColor,
      body: Stack(
        children: <Widget>[_buildIamge(), _buildConteudo()],
      ),
    );
  }

  Widget _buildIamge() {
    return ClipPath(
        clipper: DialogonalClipper(),
        child: Image.asset(
          'assets/images/leitura.jpg',
          fit: BoxFit.fitHeight,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          color: Color.fromARGB(150, 10, 10, 10),
        ));
  }

  Widget _buildConteudo() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: _imageHeight / 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            (_conteudo.assunto).length > 40
                ? (_conteudo.assunto).substring(0, 40) + "..."
                : (_conteudo.assunto),                
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 35),
          ),
          Expanded( child: _buildTextScroll()),
        ],
      ),
    );
  }

  Widget _buildTextScroll() {
    return SingleChildScrollView(child: 
        Column(          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _conteudo.assunto, 
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400)       
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(
              _conteudo.texto,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            Divider(),
            Padding(padding: EdgeInsets.only(top: 20),
              child: Text("Esse artigo foi útil?")
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[ 
                  _buildReactButtons(Icons.thumb_up, "Útil", true),
                  _buildReactButtons(Icons.thumb_down, "Não Útil", false),
                ],
              )
            )
        ],
      )
    );
  }

  Widget _buildReactButtons(IconData icon, String text, bool util) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              color: ColorTheme.primaryColor,
              icon: Icon(icon),
              onPressed: _feedbackEnable? () { _feedbackFunction(util); } : null
            ),
            Text(util? _conteudo.likes.toString() : _conteudo.deslikes.toString())
          ],
        ),
        Text(text, style: TextStyle(fontWeight: FontWeight.w500))
      ]
    );
  }

  _feedbackFunction(bool util) {
      setState(() {
        _feedbackEnable = false;
        if(util) _conteudo.likes += 1;
        else _conteudo.deslikes += 1;

        Module.setFeedback(context, _conteudo.id, util)
          .then((value) {                      
            final snackBar = SnackBar(
              content: Text('Obrigado! Sua opinião é importante para nós.'),
              duration: Duration(seconds: 3),
            );

            _scaffoldKey.currentState.showSnackBar(snackBar);
          })
          .catchError((e) {                      
            if(util) _conteudo.likes -= 1;
            else _conteudo.deslikes -= 1;

            _feedbackEnable = true;
          });
      });
  }
}
