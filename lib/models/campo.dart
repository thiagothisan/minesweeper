import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'explosao_exception.dart';

class Campo {
  final int linha;
  final int coluna;
  final List<Campo> vizinhos = [];

  bool _aberto = false;
  bool _marcado = false;
  bool _minado = false;
  bool _explodido = false;

  Campo({@required this.linha, @required this.coluna});

  void addvizinhos(Campo vizinho) {
    final deltalinha = (linha - vizinho.linha).abs();
    final deltacoluna = (coluna - vizinho.coluna).abs();

    if (deltalinha == 0 && deltacoluna == 0) {
      return;
    }

    if (deltalinha <= 1 && deltacoluna <= 1) {
      vizinhos.add(vizinho);
    }
  }

  void abrir() {
    if (_aberto) {
      return;
    }

    _aberto = true;

    if (_minado) {
      _explodido = true;
      throw ExplosaoException();
    }

    if (vizinhacaSegura) {
      vizinhos.forEach((v) => v.abrir());
    }
  }

  void revelarBomba() {
    if (_minado) {
      _aberto = true;
    }
  }

  void minar() {
    _minado = true;
  }

  void alternarMarcacao() {
    _marcado = !_marcado;
  }

  reiniciar() {
    _aberto = false;
    _marcado = false;
    _minado = false;
    _explodido = false;
  }

  bool get minado {
    return _minado;
  }

  bool get explodido {
    return _explodido;
  }

  bool get aberto {
    return _aberto;
  }

  bool get marcado {
    return _marcado;
  }

  bool get resolvido {
    bool minadoEMarcado = minado && marcado;
    bool seguroEAberto = !minado && aberto;
    return minadoEMarcado || seguroEAberto;
  }

  bool get vizinhacaSegura {
    return vizinhos.every((v) => !v.minado);
  }

  int get qtdeMinasNaVizinhanca {
    return vizinhos.where((v) => v.minado).length;
  }
}
