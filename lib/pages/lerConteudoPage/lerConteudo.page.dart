import 'package:app_distribuida2/models/conteudo.model.dart';
import 'package:app_distribuida2/theme/colors.theme.dart';
import 'package:app_distribuida2/utils/navigator.dart';
import 'package:app_distribuida2/widgets/diagonalClipper.widget.dart';
import 'package:flutter/material.dart';

class LerConteudoPage extends StatefulWidget {
  Conteudo _conteudo;

  LerConteudoPage(this._conteudo);

  @override
  _LerConteudoPageState createState() => _LerConteudoPageState();
}

class _LerConteudoPageState extends State<LerConteudoPage> {
  final double _imageHeight = 256.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ('Ryan Barnes Um itida dashbda da ashu').length > 35
                ? ('Ryan Barnes Um itida dashbda da ashu').substring(0, 35)
                : ('Ryan Barnes Um itida dashbda da ashu'),
            style: TextStyle(
                fontSize: 26.0,
                color: Colors.white,
                fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
          ),
          Expanded( child: _buildTextScroll()),
        ],
      ),
    );
  }

  Widget _buildTextScroll() {
    return SingleChildScrollView(child: 
        Column(children: <Widget>[
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce et sollicitudin est. Suspendisse posuere nisl eu condimentum lacinia. Nam velit ligula, vulputate scelerisque imperdiet et, euismod ac metus. Donec eget aliquam ligula, sit amet convallis nisi. Aliquam sed congue tortor. Aliquam mattis, dolor at sagittis cursus, neque lacus iaculis turpis, id mattis nisl libero eu risus. Maecenas eu rhoncus turpis. Donec faucibus, erat vitae pulvinar ullamcorper, leo elit fringilla mi, quis maximus eros urna at sapien. Duis at risus ut quam pulvinar pharetra. Nullam vestibulum sit amet lacus vitae mollis. Aliquam sed congue tortor. Aliquam mattis, dolor at sagittis cursus, neque lacus iaculis turpis, id mattis nisl libero eu risus. Maecenas eu rhoncus turpis. Donec faucibus, erat vitae pulvinar ullamcorper, leo elit fringilla mi, quis maximus eros urna at sapien. Duis at risus ut quam pulvinar pharetra. Nullam vestibulum sit amet lacus vitae mollis.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
            Divider(),
            Padding(padding: EdgeInsets.only(top: 20),child: Text("Esse artigo foi útil?")),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[ 
                  _buildReactButtons(Icons.thumb_up, "Útil"),
                  _buildReactButtons(Icons.thumb_down, "Não Útil"),
                ],
              )
            )
        ],
      )
    );
  }

  Widget _buildReactButtons(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          color: ColorTheme.primaryColor,
          icon: Icon(icon),
          onPressed: () {
          },
        ),
        Text(text)
      ],
    );
  }
}
