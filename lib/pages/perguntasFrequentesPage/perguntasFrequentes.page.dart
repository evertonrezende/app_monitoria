import 'package:flutter/material.dart';

class PerguntasFrequentes extends StatefulWidget {
  @override
  _PerguntasFrequentes createState() => _PerguntasFrequentes();
}

class _PerguntasFrequentes extends State<PerguntasFrequentes> {
  Icon buscaIcon = Icon(Icons.search);
  Widget buscaBarra = Text("Perguntas Frequentes");
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //centerTitle: true,
          backgroundColor: Color(0XFF009086),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: !isSearching
              ? Text('Perguntas Frequentes')
              : TextField(
                  onChanged: (value) {
                    //_filterCountries(value);
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Busca de perguntas...",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
          //title: Text('Perguntas Frequentes'),
          actions: <Widget>[
            isSearching
                ? IconButton(
                    icon: Icon(Icons.cancel, color: Colors.white,),
                    onPressed: () {
                      setState(() {
                        this.isSearching = false;
                        //filteredCountries = countries;
                      });
                    },
                  )
                : IconButton(
                    icon: Icon(Icons.search, color: Colors.white,),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                      });
                    },
                  )
          ],
        ),
        body: Container(
          color: Colors.lightBlue[50],
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                EntryItem(data[index]),
            itemCount: data.length,
          ),
        ));
  }
}

class Entry {
  Entry(this.title, [this.children = const <Entry>[]]);

  final String title;
  final List<Entry> children;
}

final List<Entry> data = <Entry>[
  Entry(
    'Pilha',
    <Entry>[
      Entry(
        'O que é uma estrutura de pilha?',
        <Entry>[
          Entry(
              'Lorem Ipsum é simplesmente um texto fictício da indústria tipográfica e de impressão. Lorem Ipsum é o texto fictício padrão do setor desde os anos 1500, quando uma impressora desconhecida pegou uma galera do tipo e a mexeu para fazer um livro de espécimes.'),
        ],
      ),
      Entry(
        'Como implementar uma pilha?',
        <Entry>[
          Entry(
              'Ao contrário da crença popular, Lorem Ipsum não é apenas um texto aleatório. Tem raízes em uma peça de literatura latina clássica de 45 aC, perfazendo mais de 2000 anos. Richard McClintock, professor de latim no Hampden-Sydney College, na Virgínia, procurou uma das palavras mais obscuras em latim, consectetur, de uma passagem de Lorem Ipsum, e examinando as citações da palavra na literatura clássica, descobriu a fonte indubitável. Lorem Ipsum vem das seções 1.10.32 e 1.10.33')
        ],
      ),
    ],
  ),
  Entry(
    'Fila',
    <Entry>[
      Entry(
        'O que é uma estrutura de Fila',
        <Entry>[
          Entry(
              'O pedaço padrão de Lorem Ipsum usado desde os anos 1500 é reproduzido abaixo para os interessados. As seções 1.10.32 e 1.10.33 de "de Finibus Bonorum et Malorum" de Cícero também são reproduzidas em sua forma original exata, acompanhadas de versões em inglês da tradução de 1914 por H. Rackham.')
        ],
      ),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    Divider();

    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(3.0),
      color: Colors.greenAccent,
      child: ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(
          root.title,
          style: TextStyle(color: Colors.black87),
        ),
        children: root.children.map(_buildTiles).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
