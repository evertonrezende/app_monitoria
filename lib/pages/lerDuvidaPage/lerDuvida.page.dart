import 'package:app_distribuida2/models/duvida.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:app_distribuida2/widgets/diagonalClipper.widget.dart';
import 'package:flutter/material.dart';
import './lerDuvidas.module.dart' as Module;

class LerDuvidaPage extends StatefulWidget {
  final Duvida _duvida;

  LerDuvidaPage(this._duvida);

  @override
  _LerDuvidaPageState createState() => _LerDuvidaPageState(_duvida);
}

class _LerDuvidaPageState extends State<LerDuvidaPage> {
  Duvida _duvida;
  final double _imageHeight = 256.0;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  
  _LerDuvidaPageState(this._duvida);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Dúvida", style: Theme.of(context).textTheme.headline6),
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
          'assets/images/duvida.jpg',
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
            (_duvida.assunto).length > 40
                ? (_duvida.assunto).substring(0, 40) + "..."
                : (_duvida.assunto),                
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
              "PERGUNTA: " + _duvida.assunto, 
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400)       
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(
              "RESPOSTA: " + _duvida.resposta,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            Divider(),
            if(_duvida.util == null)
              ..._buildSessaoAvaliacao()
        ],
      )
    );
  }

  List<Widget> _buildSessaoAvaliacao() {
    return [      
        Padding(padding: EdgeInsets.only(top: 20),
          child: Text("Esse resposta foi útil?")
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
    ];
  }

  Widget _buildReactButtons(IconData icon, String text, bool util) {
    return Column(
      children: <Widget>[
        IconButton(
          color: ColorTheme.primaryColor,
          icon: Icon(icon),
          onPressed: () {
            setState(() {
              _duvida.util = util;
              Module.setDuvidaUtil(context, _duvida.id, _duvida.util)
                .then((value) {                  
                  final snackBar = SnackBar(
                    content: Text('Obrigado! Sua opinião é importante para nós.'),
                    duration: Duration(seconds: 3),
                  );

                  _scaffoldKey.currentState.showSnackBar(snackBar);
                })
                .catchError((e) =>  _duvida.util = !_duvida.util);                
            });
          },
        ),
        Text(text, style: TextStyle(fontWeight: FontWeight.w500))
      ]
    );
  }
}
