import 'package:flutter/material.dart';
import 'package:minesweeper/components/campo_widget.dart';
import 'package:minesweeper/components/resultado_widget.dart';
import 'package:minesweeper/models/campo.dart';
import 'package:minesweeper/models/explosao_exception.dart';

class CampoMinadoApp extends StatelessWidget {
  void _reiniciar() {
    print('reiniciar...');
  }

  void _abrir(Campo campo) {
    print('Abrir...');
  }

  void _alternarMarcacao(Campo campo) {
    print('Alternar marcacao...');
  }

  @override
  Widget build(BuildContext context) {
    Campo vizinho1 = Campo(linha: 1, coluna: 0);
    vizinho1.minar();

    Campo campo = Campo(linha: 0, coluna: 0);
    campo.addvizinhos(vizinho1);

    try {
      //campo.minar();
     // campo.abrir();
     campo.alternarMarcacao();
    } on ExplosaoException {}

    return MaterialApp(
      home: Scaffold(
        appBar: ResultadoWidget(
          venceu: true,
          onReiniciar: _reiniciar,
        ),
        body: Container(
          child: CampoWidget(
            campo: campo,
            onAbrir: _abrir,
            onAlternarMarcacao: _alternarMarcacao,
          ),
        ),
      ),
    );
  }
}
