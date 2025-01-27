import 'package:flutter/material.dart';

enum Prioridade {
  vermelho(1, 'vermelho'),
  laranja(2, 'laranja'),
  amarelo(3, 'amarelo'),
  verde(4, 'verde'),
  azul(5, 'azul');

  final int valor;
  final String nome;

  const Prioridade(this.valor, this.nome);

  static Prioridade fromValor(int valor) {
    return Prioridade.values.firstWhere(
      (prioridade) => prioridade.valor == valor,
      orElse: () =>
          Prioridade.azul, // Valor padrão caso o valor não seja encontrado
    );
  }

  static Color getColor(Prioridade prioridade) {
    switch (prioridade) {
      case Prioridade.vermelho:
        return Colors.red;
      case Prioridade.laranja:
        return Colors.orange;
      case Prioridade.amarelo:
        return Colors.yellow;
      case Prioridade.verde:
        return Colors.green;
      case Prioridade.azul:
        return Colors.blue;
    }
  }
}
