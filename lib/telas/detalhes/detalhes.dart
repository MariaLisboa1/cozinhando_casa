import 'package:flutter/material.dart';
import '../../modelos/receita.dart';

class Detalhes extends StatelessWidget {

  final Receita receita;

  Detalhes({Key key, @required this.receita}): super(key: key);

  @override
  Widget build(BuildContext context) {

    return _contruirDetalhes();
  }

  Widget _contruirDetalhes() {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _contruidImagemDetalhes(receita.foto),
          _contruidTituloDetalhes(receita.titulo),
          _contruirLinhaIconesDetalhes('${receita.porcoes} porções',receita.tempoPreparo),
          _contruirSubtituloDetalhes('Ingredientes'),
          _contruirTextoDetalhes(receita.ingredientes),
          _contruirSubtituloDetalhes('Modo de Preparo'),
          _contruirTextoDetalhes(receita.modoPreparo),
        ],
      ),
      appBar: _construirAppBar(),
    );
  }
  
  Widget _contruidImagemDetalhes(imagem) {
    return Image.asset(imagem);
  }

  Widget _contruidTituloDetalhes(titulo) {
    return Center(
      child: Text(titulo, style: TextStyle(
          color: Colors.deepOrange,
          fontSize: 30
      ),),
    );
  }

  Widget _contruirLinhaIconesDetalhes(rendimento, tempo_preparo) {
    return Row(
      children: <Widget>[
        _contruirColunaIconeDetalhes(Icons.restaurant, rendimento),
        _contruirColunaIconeDetalhes(Icons.timer, tempo_preparo)
      ],
    );
  }

  Widget _contruirColunaIconeDetalhes(icone, texto) {
    return Expanded(
        child: Column(
          children: <Widget>[
            Icon(icone, color: Colors.deepOrange),
            Text(texto, style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold)),
          ],
        )
    );
  }

  Widget _contruirSubtituloDetalhes(subtitulo) {
    return Center(
      child: Text(subtitulo, style: TextStyle(
          fontSize: 20
      )),
    );
  }

  Widget _contruirTextoDetalhes(texto) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(texto),
    );
  }

  Widget _construirAppBar() {
    return AppBar(title: Text('Cozinhando em Casa'));
  }
}