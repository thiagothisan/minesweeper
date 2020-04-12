import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:minesweeper/models/campo.dart';

main() {
  group("campo", () {
    test('Abrir campo com explosao', () {
      Campo c = Campo(linha: 0, coluna: 0);
      c.minar();

      expect(c.abrir, throwsException);
    });

    test('Abrir campo sem explosao', () {
      Campo c = Campo(linha: 0, coluna: 0);

      c.abrir();

      expect(c.aberto, isTrue);
    });

    test('Adicionar nao vizinho', () {
      Campo c1 = Campo(linha: 0, coluna: 0);
      Campo c2 = Campo(linha: 1, coluna: 3);

      c1.addvizinhos(c2);

      expect(c1.vizinhos.isEmpty, isTrue);
    });

    test('Adicionar vizinho', () {
      Campo c1 = Campo(linha: 3, coluna: 3);
      Campo c2 = Campo(linha: 3, coluna: 4);
      Campo c3 = Campo(linha: 2, coluna: 2);
      Campo c4 = Campo(linha: 4, coluna: 4);

      c1.addvizinhos(c2);
      c1.addvizinhos(c3);
      c1.addvizinhos(c4);

      expect(c1.vizinhos.length, 3);
    });

    test('Minas na vizinhanca', () {
      Campo c1 = Campo(linha: 3, coluna: 3);

      Campo c2 = Campo(linha: 3, coluna: 4);
      c2.minar();

      Campo c3 = Campo(linha: 2, coluna: 2);

      Campo c4 = Campo(linha: 4, coluna: 4);
      c4.minar();

      c1.addvizinhos(c2);
      c1.addvizinhos(c3);
      c1.addvizinhos(c4);

      expect(c1.qtdeMinasNaVizinhanca, 2);
    });

  });
}
